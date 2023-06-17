set.seed(1797) # Fixando a semente em 1851

p <- 0.2 # Parâmetro da distribuição geométrica
n <- 1135 # Tamanho da amostra

# Função de distribuição acumulada (FDA) da distribuição geométrica
FDA_geom <- function(x, p) {
  if (x < 0) {
    return(0)
  } else {
    return(1 - (1 - p)^x)
  }
}

# Função de transformação inversa
inv_transform <- function(u, p) {
  x <- 0
  Fx <- FDA_geom(x, p)
  while (Fx < u) {
    x <- x + 1
    Fx <- FDA_geom(x, p)
  }
  return(x)
}

# Simulação da amostra
amostra <- replicate(n, inv_transform(runif(1), p))

# Cálculo da média e desvio padrão amostrais
media_amostral <- mean(amostra)
desvio_padrao_amostral <- sd(amostra)

# Proporção de valores simulados que satisfazem as condições
comp <- media_amostral + desvio_padrao_amostral
proporcao <- mean(amostra[amostra > media_amostral] > comp)

# Resultado final
cat("Proporção de valores simulados que são superiores à soma da média com o desvio padrão amostrais:",
    round(proporcao, 4)) 