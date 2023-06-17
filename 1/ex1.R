install.packages('ggplot2')
library('ggplot2')
install.packages('readxl')
library('readxl')
install.packages('dplyr')
library('dplyr')

data = read_excel('./econ.xlsx', skip = 19, col_names=c("tempo", "skip", "pop", "skip", "ddesemp", "skip"))
ddesemp = data$ddesemp
pop = data$pop
ddesemp_mean = mean(ddesemp)
pop_mean = mean(pop)
ddesemp_sd = sd(ddesemp)
pop_sd = sd(pop)
ddesemp_transformed = (ddesemp - ddesemp_mean) / ddesemp_sd
pop_transformed = (pop - pop_mean) / pop_sd

graph_data = data.frame(ddesemp_transformed, pop_transformed)
graph = ggplot(graph_data, aes(x = data$tempo, y = ddesemp_transformed)) +
        geom_line(color = "blue") + 
        geom_line(aes(y = pop_transformed), color = "red") + 
        labs(title = "Evolução do número de desempregados em Portugal",
        x = "Ano", 
        y = "Evolucao") +
        scale_color_manual(name = "Variáveis",
                           values = c("blue", "red"), 
                           labels = c("X1", "X2"))