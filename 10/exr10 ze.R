mu <- 31.6
sigma <- 2
alpha <- 0.01
seed <- 1773
m <- 100
n <- 27

set.seed(seed)
samples <- matrix(rnorm(m * n, mean = 32.8, sd = sigma), ncol = n)

test_statistic <- (colMeans(samples) - mu) / (sigma / sqrt(n))
results <- vector("list", m)
for (i in 1:m) {
  results[[i]] <- t.test(samples[i,], mu = mu, alternative = "two.sided", conf.level = 1 - alpha)
}

probabilidade_nao_rejeicao <- sum(sapply(results, function(x) x$p.value > alpha)) / m

cat("Probabilidade de não rejeição de H0:", round(probabilidade_nao_rejeicao, 3))

