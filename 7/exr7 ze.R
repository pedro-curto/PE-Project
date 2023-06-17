set.seed(1920)
m <- 2723
n <- 11
amostras <- matrix(rnorm(m * n), nrow = m)

somas_quadrados <- apply(amostras, 1, function(x) sum(x^2))

quantil_amostra <- quantile(somas_quadrados, probs = 0.56, type = 2)

quantil_teorico <- qchisq(0.56, df = n)

diferenca <- round(abs(quantil_amostra - quantil_teorico), 4)

diferenca
# ao zé dá 0.1198