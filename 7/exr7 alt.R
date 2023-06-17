set.seed(1916)  # Fixando a semente em 1204

m <- 1792  # Número de amostras
n <- 14   # Tamanho das amostras

# Simulação das amostras e cálculo das somas dos quadrados
sums_of_squares <- replicate(m, sum(rnorm(n)^2))

# Cálculo do quantil de probabilidade 0.52 da amostra
quantile_sample <- quantile(sums_of_squares, probs = 0.32, type = 2)

# Cálculo do quantil correspondente à distribuição teórica da soma de quadrados de variáveis normais reduzidas independentes
quantile_theoretical <- qchisq(0.32, df = n)

# Diferença em valor absoluto entre os quantis
diferenca_absoluta <- abs(quantile_sample - quantile_theoretical)

# Arredondando a diferença absoluta a 4 casas decimais
diferenca_absoluta_arredondada <- round(diferenca_absoluta, 4)

diferenca_absoluta_arredondada
# este dá 0.0819