---
title: "gtrendsR_exemplo"
author: "Leonardo Oliveira"
date: "7 de dezembro de 2018"
output: html_document
---



# Produção de gráficos com ![R](http://developer.r-project.org/Logo/Rlogo-5.png)
## Tópico: Google Trends com R (Usando 1 comando)
  
AtrAvés da Package gtrendsR, de Philippe Massicotte e Dirk Eddelbuettel, conseguimos acessar o Goggle Trends, apenas utilizando um comando:

Este comando é a função gtrends(), Google Trends Query, na qual enviamos os argumentos de pesquisa e nos é retornado uma lista com sete grupos de informações, a respeito da popularidade obtida na pesquisa do Google. Vale lembrar que o Google Trends retorna sempre valores relativos, normalizados de 0 a 100, onde 100 não é 100%, mas o maior valor encontrado dentro da pesquisa. 

A pesquisa traz os dados que a compõem, como: país, região, cidade, datas, principais consultas realizadas com o termo pesquisado.

O pacote gtrendsR apenas implementa no R o log da sessão no Trends, envia a consulta e obtém o resultado. Então o 'ganho' está em poder utilizar esta query como mais uma das quase infinitas possibilidades dentro do R, . 

Primeiramente chamamos a biblioteca já instalada 



Como exemplo, vamos procurar a palavra Natal, colocando a geolocalização para Brasil, e pegando os últimos três meses (gerado em: 07/12/2018), e traçar um gráfico simples.


```r
List_natal <- gtrends(keyword="natal",geo=c("BR"),time="today 3-m")
plot(List_natal)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png)

Logicamente, de outubro a dezembro, há um aumento significativo das pesquisas por natal, então vamos ver como seria a variação dentro de um ano. 


```r
List_natal_1ano <- gtrends(keyword="natal",geo=c("BR"),time="today 12-m")
plot(List_natal_1ano)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3-1.png)
 
Como podemos ver, existe uma acentuação no gráfico, que define a relevância desta procura, indicando que a popularidade aumenta muito quanto mais próximo se chega do natal, o que também pode ser evidenciado olhando os últimos 5 anos:


```r
List_natal5anos <- gtrends(keyword="natal",geo=c("BR"),time="today+5-y")
plot(List_natal5anos)
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4-1.png)

Outra maneira é pesquisarmos todo o período disponível, time="all", que é desde 2004. Não querendo chegar a uma conclusão rápida, apenas é visível a diminuição da popularidade desta pesquisa de 2004 até 2008. Ou seja, aparentemente houveram menos buscas, no Brasil, conforme foram passando os anos. 


```r
List_natal_tudo <- gtrends(keyword="natal",geo=c("BR"),time="all")
plot(List_natal_tudo)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png)

Vale lembrar também que a pesquisa da palavra "natal" também remete à outras pesquisas, como por exemplo a capital do Rio Grande do Norte, o nascimento em si (natalidade), dentre outras que ficam no background do gráfico, pois vemos que nestas extrações nunca chegou a zero o grau de popularidade das pesquisas.

O que quer dizer que a Google Trends Query de nenhuma forma pode ser considerada como uma resposta final, determinante ou condicionante que qualquer análise que se possa fazer, mas sim pode ser um ótimo primeiro passo para o início de uma investigação, pode ser um direcionador para entendermos o comportamento de mercado ou de opiniões em certo período do tempo, ou um simples aliado à outras técnicas que se desenvolve.

Brincando com esta ideia, vamos ver o que acontece quando olhamos para a mesma pequisa, trocando a localização para USA, ao invés do Brasil. 


```r
List_natal_tudo_US <- gtrends(keyword="natal",geo=c("US"),time="all")
plot(List_natal_tudo_US)
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6-1.png)

Ops, acho que não era a palavra correta. Este aumento em 2009 e 2010 deve ser uma época em que havia muitos brasileiros nos Estados Unidos, ou muitos estadunidenses procurando férias nas praias de Natal. [joke]


```r
List_christmass_tudo_US <- gtrends(keyword="Christmass",geo=c("US"),time="all")
plot(List_christmass_tudo_US)
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-1.png)

Vemos um padrão de comportamento nos gráficos da popularidade parecido entre os dois países, no que se refere à frequencia anual, porém com uma dinâmica diferente, pois enquanto no Brasil vem decrescendo, tendo seu pico no início do período, nos Estados Unidos houve uma oscilação diferente. 


```r
List_christmass_tudo_US <- gtrends(keyword=c("Natal","Christmass"),geo=c("BR","US"),time="all")
plot(List_christmass_tudo_US)
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-1.png)

Para terminar, vamos comparar palavras diferentes, relativos a datas específicas do ano. 


```r
List_comemorativas <- gtrends(keyword=c("carnaval","pascoa","finados","natal"),geo=c("BR"),time="today+5-y")
plot(List_comemorativas)
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9-1.png)
