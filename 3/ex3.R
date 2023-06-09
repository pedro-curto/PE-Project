install.packages('ggplot2')
library('ggplot2')
setwd('C:/Users/Pedro Curto/Desktop/Desktop/Uni/2º ano/Atual/PE/Projeto/3')

data = read.csv('GENDER_EMP_19032023152556091.txt', sep = '\t')
emp1 = data[data$IND == 'EMP1' & 
            data$Age.Group %in% c('15-24', '25-54', '55-64') &
            data$Country == 'Israel' & 
            data$Time == 2018,]

men_emp1 = emp1[emp1$Sex == 'Men',]
women_emp1 = emp1[emp1$Sex == 'Women',]
graph_data = data.frame(age = men_emp1$Age.Group)


