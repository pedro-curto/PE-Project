install.packages("ggplot2")
library("ggplot2")

set.seed(1502)
n = 184
loc = 0.2
scale = 2

cauchy_sample = sort(rcauchy(n, loc, scale))
prob_vec = (1:n) /(n+1)
cauchy_quantiles = qcauchy(prob_vec, loc, scale)

plot_data = data.frame(cauchy_sample, cauchy_quantiles)

quantis_bissectriz <- quantile(cauchy_sample[seq(1, n, by = 2)], probs = c(0.25, 0.75))

graph = ggplot(plot_data, aes(x = cauchy_sample, y = cauchy_quantiles)) +
  geom_point(color = "blue") +
  geom_abline(intercept = quantis_bissectriz[1], slope = 1, linetype = "dashed", color = "green") +
  labs(x = "Valores Gerados (Ordenados)",
       y = "Quantis de Probabilidade",
       title = "Valores Gerados vs. Quantis de Probabilidade (Distribuição de Cauchy)")
