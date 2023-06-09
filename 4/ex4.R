set.seed(4267)
k = 2072
lambda = 7.5
amostra_exp = rexp(k, rate = lambda)

soma_observacoes = cumsum(amostra_exp)

T = ceiling(soma_observacoes[k])

contagem_eventos = rep(0, T)
for (i in 1:k) {
  contagem_eventos[ceiling(soma_observacoes[i])] =
    contagem_eventos[ceiling(soma_observacoes[i])] + 1
}

media_acontecimentos = mean(contagem_eventos)

valor_esperado = lambda
desvio_absoluto = abs(media_acontecimentos - valor_esperado)

desvio_absoluto_arredondado = round(desvio_absoluto, 4)
