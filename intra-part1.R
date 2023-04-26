#####################################################################
#############Importation des donnees#################


setwd("C:/Users/KESTIA/My Documents/Banque")
data_credits<- read.csv("CreditBancaire.csv")
data_credits


########################################################################
######## Calcul de la moyenne du credit##############

library(dplyr)
col_class<- data.frame(apply(data_credits,2, class))
col_class              ###Remarque: Les donnees sont de type caractere.


#####################################################################
######### Conversion des variables en donnees numeriques#########

data_credits$Credit<- as.numeric(data_credits$Credit)
data_credits$Jours<- as.numeric(data_credits$Jours)
str(data_credits)

###################################################################
####### D'ou le calcul de la moyenne##########
data_credits%>%summarize(moyenne=mean(Credit))

####################################################################
########## Calcul de la moyenne par type de credits##############

Moyennes<- data_credits%>%group_by(Type)%>%summarise((moyenne=mean(Jours)))
Moyennes
class(Moyennes)


################################################################################
######## Representons graphiquement le data.frame "Moyennes" obtenu #######
################################################################################

###Creons 2 objets pour les types et moyennes de credits pour gagner du temps


Type<- c( "Commerce", "Consommation", "Production")
Type
moyenne<- c(80.8, 66.3, 95.9)
moyenne

library(ggplot2)
ggplot(Moyennes)+
  geom_bar(aes(x=Type, y= ..moyenne.., group=1), 
           color="magenta", fill="navyblue",width = 0.6)+
  ggtitle("Moyenne des credits par type")


###le graphe ainsi obtenu est un diagramme a barres dans lequel on peut comparer les moyennes des types de credit entre elles

