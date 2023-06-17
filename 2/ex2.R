dados = read.csv("./TIME_USE_24092022.csv")
dados = subset(dados, País != "África do Sul")

outros_mulheres = subset(dados,
                          Ocupação != "Trabalho não remunerado" & Sexo == "Mulheres",
                          select = "Tempo")

nao_remunerado_mulheres = subset(dados,
                                  Ocupação == "Trabalho não remunerado" & Sexo == "Mulheres",
                                  select = "Tempo")

boxplot( c(outros_mulheres, nao_remunerado_mulheres),
        names = c("Outros","Trabalho não remunerado"),
        col = c('red','blue'),
        horizontal = TRUE,
        main = "Tempos médios diários registados para mulheres",
        xlab = "Tempo (minutos)")