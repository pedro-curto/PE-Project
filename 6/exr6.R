probabilidade <- log10(1 + 1/1) + log10(1 + 1/9)

potencias_dois <- which(log2(27:220) %% 1 == 0)
potencias_19 <- potencias_dois[grep("^(1|9)", as.character(potencias_dois))]
fracao_19 <- length(potencias_19) / length(potencias_dois)

desvio_absoluto <- abs(fracao_19 - probabilidade)
desvio_arredondado <- round(desvio_absoluto, 4)

print(desvio_arredondado)
