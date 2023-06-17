install.packages('ggplot2')
library('ggplot2')
install.packages('readxl')
library('readxl')
install.packages('dplyr')
library('dplyr')
data = read_excel('./econ.xlsx', skip = 43, col_names=c("tempo", "gcp", "skip", "tpp", "skip", "skip"))
gcp = data$gcp
tpp = data$tpp
gcp_mean = mean(gcp)
tpp_mean = mean(tpp)
gcp_sd = sd(gcp)
tpp_sd = sd(tpp)
gcp_transformed = (gcp - gcp_mean) / gcp_sd
tpp_transformed = (tpp - tpp_mean) / tpp_sd
graph_data = data.frame(gcp_transformed, tpp_transformed)
ggplot(graph_data, aes(x = data$tempo)) +
        geom_line(aes(y = gcp_transformed, color="gcp")) + 
        geom_line(aes(y = tpp_transformed, color="tpp")) + 
        labs(title = "Variação de gcp e tpp em Portugal desde 1971 até 2015",
        x = "Ano", 
        y = "Variação") + 
        scale_color_manual(values = c("gcp" = "blue", "tpp" = "red"),
                           labels = c("Gastos de consumo pessoal", "Taxa de poupança pessoal")) +
        theme(legend.position = c(0.5, 0.95),
              legend.background = element_rect(fill = "transparent")) + 
        guides(color=guide_legend(title=""))