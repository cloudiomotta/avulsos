####Aula Pr�tica#####

dado <- read.csv("pop2000.csv", sep = ";",header = T)

#Visualizando o banco
View(dado)

names(dado)

#Tamanho da Pop da regi�o X

tamanho <- sum(dado$Total)
tamanho

#Situa��o de Domic�lio

# http://tabnet.datasus.gov.br/cgi/deftohtm.exe?ibge/cnv/popuf.def


# Densidade Demogr�fica (hab/Km2): habitantes/�rea

# Vamos calcular a densidade populacional do Jap�o. O pa�s possui uma �rea de
# 377.801 km� e uma popula��o, em 2010, de 127.156.225 habitantes.

d <- 127156225 / 377801
d

# D~336.6hab/km2
# Grau de Urbaniza��o da popula��o brasileira em 2000
#(http://tabnet.datasus.gov.br/cgi/tabcgi.exe?ibge/cnv/popuf.def)

g <- (137953959 / 169799170) * 100
g

#Raz�o de Sexo

dado$rs <- dado$Homens / dado$Mulheres
dado$rs

#Raz�o de Sexo ao Nascer (< 1 ano)

masculino <- 1635916
feminino <- 1577394

rs0 <- masculino / feminino
rs0

library(tidyverse)

#Fazendo o gr�fico da Raz�o de Sexo

ggplot(data = dado,
       aes(x = Idade, y = rs)) +
       geom_line(colour = "orange", size = 1.5) +
       geom_hline(yintercept = 1, linetype = "dashed") +
       labs(title = "Raz�o de Sexo, Brasil, 2000",
            y = "Raz�o de Sexo",
            caption = "Censo Demogr�fico, IBGE, 2000")

#Propor��o de 0 a 14

tamanho
selecionado0a14 <- c(dado$Total[1], dado$Total[2], dado$Total[3])
selecionado0a14
pop0a14 <- (sum(selecionado0a14) / tamanho) * 100
pop0a14

#Propor��o de 15 a 59

selecionado15a59 <- c(dado$Total[4:12])
selecionado15a59
pop15a59 <- (sum(selecionado15a59) / tamanho) * 100
pop15a59

#Propor��o de 60 anos ou mais

selecionado60oumais <- c(dado$Total[13:17])
selecionado60oumais
pop60oumais <- (sum(selecionado60oumais) / tamanho) * 100
pop60oumais

pop0a14 + pop15a59 + pop60oumais

#�ndice de envelhecimento (ideal comparar ao longo do tempo dos Censos)

IE <- ((sum(selecionado60oumais)) / (sum(selecionado0a14))) * 100
IE

# Raz�o de Depend�ncia (ideal comparar ao longo do tempo dos Censos)

a <- sum(selecionado60oumais)
b <- sum(selecionado0a14)
c <- sum(selecionado15a59)
RD <- ((a + b) / c) * 100
RD

#Pir�mide et�ria

total <- with(dado, sum(Homens, na.rm = TRUE) + sum(Mulheres, na.rm = TRUE))
total

piramide <- dado %>%
  mutate(Homens = (Homens / total) * -1,
         Mulheres = (Mulheres / total))
piramide


piramide$Idade <- factor(piramide$Idade, labels = c("0-4", "5-9",
  "10-14", "15-19", "20-24", "25-29", "30-34", "35-39", "40-44", "45-49",
  "50-54", "55-59", "60-64", "65-69", "70-74", "75-79", "80+"))
piramide

 
figura <- ggplot(piramide) +
  geom_col(aes(Idade, Homens), fill = "blue") +
  geom_col(aes(Idade, Mulheres), fill = "red") +
  labs(title = "Pir�mide et�ria no Brasil, 2000",
       x = "Idade",
       y = "",
       caption = "Fonte:Censo Demogr�fico, IBGE, 2000.") +
  coord_flip() +
  scale_y_continuous(
    breaks = c(seq(-0.050, -0.025, by = 0.025),
               seq(0.000, 0.050, by = 0.025)),
    labels = c(seq(-0.050, -0.025, by = 0.025) * -1,
               seq(0, 0.050, by = 0.025)))
print(figura)