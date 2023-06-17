install.packages('ggplot2')
library('ggplot2')

data = read.csv('./GENDER_EMP_19032023152556091.txt', sep = '\t')
emp1 = data[data$IND == 'EMP1' & 
            data$Age.Group %in% c('15-24', '25-54', '55-64') &
            data$Country == 'United Kingdom' & 
            data$Time == 2005,]

men_emp1 = emp1[emp1$Sex == 'Men',]
women_emp1 = emp1[emp1$Sex == 'Women',]
graph_data = rbind(men_emp1, women_emp1)
                        
ggplot(graph_data, aes(x = Age.Group, y = Value, fill = Sex)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Labour Force Participation Rate by Sex and Age Group (2005, United Kingdom)",
       x = "Age Group",
       y = "Labour Force Participation Rate") +
  scale_fill_manual(values = c("blue", "red"),
                    labels = c("Men", "Women"))