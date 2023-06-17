set.seed(1797) # fixar a semente
u = runif(1135) # gerar amostra uniforme
p = 0.2 # parâmetro da distribuição geométrica
x = floor(log(u) / log(1-p)) # aplicar o método de transformação inversa

media_amostral = mean(x)
desvio_padrao_amostral = sd(x)

contagem = sum(x > media_amostral + desvio_padrao_amostral)

proporcao = contagem / sum(x > media_amostral)

resultado = round(proporcao, 4)
