set.seed(1385)
m <- 1029
n <- 12
amostras <- matrix(rnorm(m * n), nrow = m)

somas_quadrados <- apply(amostras, 1, function(x) sum(x^2))

quantil_amostra <- quantile(somas_quadrados, probs = 0.35, type = 2)

quantil_teorico <- qchisq(0.35, df = n)

diferenca <- round(abs(quantil_amostra - quantil_teorico), 4)

print(diferenca)
# ao zé dá 0.0819