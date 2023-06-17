# Função de probabilidade da distribuição de Benford
prob_benford <- function(x) {
  log10(1 + 1/x)
}

# 1. Probabilidade de X ser igual a 1 ou 9
prob_1_or_9 <- prob_benford(1) + prob_benford(9)
prob_1_or_9

# 2. Fração de potências de dois no intervalo [2^7, 2^20] cujo primeiro algarismo é igual a 1 ou 9
powers_of_two <- 2^(7:20)
first_digit <- floor(powers_of_two / 10^(floor(log10(powers_of_two))))
fraction_1_or_9 <- mean(first_digit == 1 | first_digit == 9)
fraction_1_or_9

# 3. Desvio absoluto entre os valores calculados em 1 e 2
desvio_absoluto <- abs(prob_1_or_9 - fraction_1_or_9)
round(desvio_absoluto, 4)
