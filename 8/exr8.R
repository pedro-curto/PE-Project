library("ggplot2")
set.seed(1803)
n <- 152
amostra_cauchy <- rcauchy(n, location = 2.2, scale = 1.4)
amostra_normal <- rnorm(152, mean = 3.4, sd = sqrt(2.4))

# Ordenando os valores em ordem crescente
valores_ordenados <- sort(amostra_cauchy)

# Quantis de probabilidade
quantis <- (1:n) / (n + 1)

# Bissetriz dos quadrantes ímpares
bissetriz <- quantis

# Criando o data frame para o gráfico
dados <- data.frame(Valores_Ordenados = valores_ordenados, Quantis = quantis, Bissetriz = bissetriz)

# Criando o gráfico
grafico <- ggplot(dados, aes(x = Quantis, y = Valores_Ordenados)) +
  geom_point() +
  geom_line(aes(y = Bissetriz, color = "Bissetriz"), linetype = "dashed") +
  labs(x = "Quantis de Probabilidade", y = "Valores Ordenados")

# Exibindo o gráfico
print(grafico)
