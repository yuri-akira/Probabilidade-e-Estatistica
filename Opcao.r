library(readxl)
respostas <- read_excel("C:/respostas.xlsx")
names(respostas)[names(respostas)=="Se pudesse, optaria por manter esse formato durante todo seu curso?"]="opcao" #renomeando



cores <- c("#FF6347", "yellow", "#3CB371") #escolhendo as cores hexadecimais a serem usadas no gráfico
tabela<-paste(round(table(respostas$"opcao")/length(respostas$"opcao")*100), "%", sep="")
tabela

pie(round((table(respostas$"opcao")/length(respostas$"opcao")*100),2),labels=tabela, cex=1.2, col=cores, main = "Se pudesse,
    optaria por manter o formato a distância durante
    todo seu curso?")

legend("topleft", c("Sim","Talvez","Não"), cex = 1.0, #configurando a legenda
       fill = c("#3CB371","#FFFF00","#FF6347"))

nAlunos =c(16, 4, 4)#adicionando os números de alunos

par(las=1) # deixar nomes dos eixos perpendicular
par(mar=c(5,7,1,1)+0.1) # para aumentar a margem a esquerda


x <- barplot(nAlunos, xlab = "Nº de alunos",xlim=c(0,20), #gerando gráfico frequência absoluta
             names.arg=c(row.names =c("Não",
                                      "Talvez",
                                      "Sim")), horiz=TRUE,col=c("red","yellow","#3CB371"), main ="Se pudesse, optaria por manter o formato a distância durante todo o seu curso?")
text(nAlunos-0.5*nAlunos, x,labels=round(nAlunos), col="Black", cex=1.0) #Exibindo o nº de alunos dentro das barras

par(mar=c(5,4,4,2)+0.1) # para retornar a margem default
barplot((table(respostas$"opcao")/length(respostas$"opcao")*100), xlab = "Optaria por manter o formato a distância durante todo o seu curso?",
ylab = "% Alunos", col=c("red","yellow","#3CB371"), ylim=c(0,100)) #gerando gráfico de frequência relativa



