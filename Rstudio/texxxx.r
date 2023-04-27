library(tidyverse)

aula<-read.csv('Rstudio/popu.csv', sep = ';', header = T)

#View(aula)
  
#print(names(aula))


TBM=(sum(aula$obito)/sum(aula$pop2000))*1000
#TBM     #Interprete o resultado


# Taxa espec�fica de mortalidade

aula$TEM=aula$obito/aula$pop2000 
aula$TEM #Interprete

#Fazendo o gr�fico da TEM com um fundo mais limpo

f1=ggplot(data = aula, 
         aes(x = Idade, y = TEM))+
         geom_line(colour = "red", size=1.5)+
         geom_point(colour="orange", size=5)+
         scale_x_continuous(limits = c(0,80), breaks =scales::breaks_width(5))+ 
         theme_minimal()+
         labs(title="Taxa Espec�fica de Mortalidade, Brasil, 2000",
         y = "TEM", caption = "Censo Demogr�fico, IBGE, 2000")
f1

# No Datasus encontre os �bitos de menores de 1 ano e a informa��o de nascidos vivos

#C�lculo da Taxa de Mortalidade Infantil

obt=68199
nv=3206761
TMI=obt/nv*1000
TMI

# Taxa de mortalidade proporcional por doen�as cardiovasculares
# (no DATASUS encontre o n�mero de �bitos por doen�as cardiovasculares-Cap�tulo IX)
# Datasus: http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sim/cnv/obt10uf.def

obt_cardio=260603
obt_cardio
total_obitos=sum(aula$obito)
total_obitos

mort_prop=obt_cardio/total_obitos*100
mort_prop # Interprete os resultados

# Calcule a taxa de mortalidade espec�fica por causas externas (cap�tulo XX).
# Datasus: http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sim/cnv/obt10uf.def

obt_causasext=118397
pop_total=sum(aula$pop2000)
pop_total

TEMext=obt_causasext/pop_total*100000
TEMext # Interprete os resultados

# No site do IBGE encontre a esperan�a de vida para o Brasil em 2000 e 2010 e interprete o resultado.
# N�o vamos aprender calcular/decompor a t�bua de vida neste curso.

#Lendo o banco de dados de fecundidade, calcule para o Brasil em 2000 os seguintes indicadores.

fec=read.csv('Rstudio/facun.csv', sep=";", header = T)
View(fec)
names(fec)

# Taxa Bruta de Natalidade - TBN

NV=3206761 #J� tinha sido calculado na parte componente mortalidade para o indicador TMI
NV

pop_total

TBN=NV/pop_total*1000
TBN   #Interprete o indicador

# Taxa Espec�fica de Fecundidade - TEF

fec$TEF=fec$NV/fec$Popf
fec$TEF #Interprete

#Fazendo o gr�fico da TEF com um fundo mais limpo. Mesma l�gica do de cima.

f2=ggplot(data = fec, 
       aes(x = Idade, y = TEF))+
  geom_line(colour = "blue", size=1.5)+
  geom_point(colour="blue", size=5)+
  #ajustando o eixo x
  scale_x_continuous(limits = c(15,50), breaks =scales::breaks_width(5))+ 
  #mudando o fundo
  theme_minimal()+
  #colocando o titulo nos eixos, do gr�fico e a fonte
  labs(title="Taxa Espec�fica de Fecundidade, Brasil, 2000",
       y = "TEF",
       caption = "Censo Demogr�fico, IBGE, 2000")
print(f2)


# Taxa de Fecundidade Total 

TFT=sum(fec$TEF)*5
TFT

# Idade M�dia da Fecundidade (explicar esse indicador. Achei mais pr�tico na aula em R)
# IMF=  (sum (TEFi*ponto m�dio intervalo de idade))/(sum(TEF15-49))

fec$ponto_medio=fec$Idade+2.581

IMF=(sum(fec$ponto_medio*fec$TEF))/(sum(fec$TEF))
print(IMF) #Interprete
