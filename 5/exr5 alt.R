set.seed(1797)
p <- 0.2
n <- 1135

# Vetor para armazenar os valores simulados
simulated_values <- numeric(n)

# Simulação da distribuição geométrica
for (i in 1:n) {
  u <- runif(1)  # Passo I: Gerar valor uniforme entre 0 e 1
  x <- 0        # Inicializar x como 0
  while (u > p) {
    x <- x + 1  # Incrementar x até u <= p
    u <- runif(1)  # Gerar novo valor uniforme entre 0 e 1
  }
  simulated_values[i] <- x  # Armazenar valor simulado
}

# Cálculo da média e desvio padrão da amostra
sample_mean <- mean(simulated_values)
sample_sd <- sd(simulated_values)

# Filtrar valores superiores à média amostral
filtered_values <- simulated_values[simulated_values > sample_mean]

# Calcular a soma da média com o desvio padrão amostrais
sum_mean_sd <- sample_mean + sample_sd

# Contar o número de valores filtrados que são superiores à soma calculada
count <- sum(filtered_values > sum_mean_sd)

# Calcular a proporção desejada
proportion <- count / length(filtered_values)

# Resultado
proportion
