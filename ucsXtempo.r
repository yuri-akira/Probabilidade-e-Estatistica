library(readxl)
respostas <- read_excel("C:/respostas.xlsx")
respostas
names(respostas)[names(respostas)=="Quantas UCs você está cursando nesse semestre?"]="UC"
names(respostas)[names(respostas)=="Em média, quantas horas diárias você está se dedicando aos estudos no formato AED?"]="horas" 


install.packages("summarytools") #para instalar
require(summarytools) #para carregar.

install.packages("ggplot2")
require("ggplot2")


ctable(respostas$UC, respostas$horas, prop = 'r', headings = FALSE) # Criação da tabela,levendo em consideração as linhas

library(dplyr)
percentData <- respostas %>% group_by(UC) %>% count(horas) %>% mutate(ratio=scales::percent(n/sum(n)))
percentData 


require(ggplot2) #plotando o gráfico
ggplot(respostas, aes(x=factor(UC),fill=factor(horas))) +
  geom_bar(position="fill") +
  geom_text(data=percentData, aes(y=n,label=ratio ), position=position_fill(vjust=0.5))+
  xlab("Número de UCs") +
  ylab("Proporção de Horas estudadas")+
  scale_fill_manual(name="Horas estudadas (dia)", values = c("red", "green", "dodgerblue3","yellow"))

