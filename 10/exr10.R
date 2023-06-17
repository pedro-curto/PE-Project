mu <- 31.6
sigma <- 2
alpha <- 0.01
seed <- 1773
m <- 100
n <- 27

set.seed(seed)
samples <- matrix(rnorm(m * n, mean = 32.8, sd = sigma), ncol = n)

test_results <- apply(samples, 1, function(x) {
  test_statistic <- (mean(x) - mu) / (sigma / sqrt(n))
  p_value <- 2 * (1 - pnorm(abs(test_statistic)))
  reject_null <- p_value < alpha
  return(reject_null)
})

prob_non_rejection <- mean(test_results)

print(format(prob_non_rejection, digits = 3))
