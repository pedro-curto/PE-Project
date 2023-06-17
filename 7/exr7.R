set.seed(1916)
m <- 1792
n <- 14
amostras <- matrix(rnorm(m * n), nrow = m)

somas_quadrados <- apply(amostras, 1, function(x) sum(x^2))

quantil_amostra <- quantile(somas_quadrados, probs = 0.32, type = 2)

quantil_teorico <- qchisq(0.32, df = n)

diferenca <- round(abs(quantil_amostra - quantil_teorico), 4)

print(diferenca)
