---
title: "gtrendsR_exemplo"
author: "Leonardo Oliveira"
date: "7 de dezembro de 2018"
output: html_document
---



# Produ��o de gr�ficos com ![R](http://developer.r-project.org/Logo/Rlogo-5.png)
## T�pico: Google Trends com R (Usando 1 comando)
  
AtrAv�s da Package gtrendsR, de Philippe Massicotte e Dirk Eddelbuettel, conseguimos acessar o Goggle Trends, apenas utilizando um comando:

Este comando � a fun��o gtrends(), Google Trends Query, na qual enviamos os argumentos de pesquisa e nos � retornado uma lista com sete grupos de informa��es, a respeito da popularidade obtida na pesquisa do Google. Vale lembrar que o Google Trends retorna sempre valores relativos, normalizados de 0 a 100, onde 100 n�o � 100%, mas o maior valor encontrado dentro da pesquisa. 

A pesquisa traz os dados que a comp�em, como: pa�s, regi�o, cidade, datas, principais consultas realizadas com o termo pesquisado.

O pacote gtrendsR apenas implementa no R o log da sess�o no Trends, envia a consulta e obt�m o resultado. Ent�o o 'ganho' est� em poder utilizar esta query como mais uma das quase infinitas possibilidades dentro do R, . 

Primeiramente chamamos a biblioteca j� instalada 



Como exemplo, vamos procurar a palavra Natal, colocando a geolocaliza��o para Brasil, e pegando os �ltimos tr�s meses (gerado em: 07/12/2018), e tra�ar um gr�fico simples.


```r
List_natal <- gtrends(keyword="natal",geo=c("BR"),time="today 3-m")
plot(List_natal)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png)

Logicamente, de outubro a dezembro, h� um aumento significativo das pesquisas por natal, ent�o vamos ver como seria a varia��o dentro de um ano. 


```r
List_natal_1ano <- gtrends(keyword="natal",geo=c("BR"),time="today 12-m")
plot(List_natal_1ano)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3-1.png)
 
Como podemos ver, existe uma acentua��o no gr�fico, que define a relev�ncia desta procura, indicando que a popularidade aumenta muito quanto mais pr�ximo se chega do natal, o que tamb�m pode ser evidenciado olhando os �ltimos 5 anos:


```r
List_natal5anos <- gtrends(keyword="natal",geo=c("BR"),time="today+5-y")
plot(List_natal5anos)
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4-1.png)

Outra maneira � pesquisarmos todo o per�odo dispon�vel, time="all", que � desde 2004. N�o querendo chegar a uma conclus�o r�pida, apenas � vis�vel a diminui��o da popularidade desta pesquisa de 2004 at� 2008. Ou seja, aparentemente houveram menos buscas, no Brasil, conforme foram passando os anos. 


```r
List_natal_tudo <- gtrends(keyword="natal",geo=c("BR"),time="all")
plot(List_natal_tudo)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png)

Vale lembrar tamb�m que a pesquisa da palavra "natal" tamb�m remete � outras pesquisas, como por exemplo a capital do Rio Grande do Norte, o nascimento em si (natalidade), dentre outras que ficam no background do gr�fico, pois vemos que nestas extra��es nunca chegou a zero o grau de popularidade das pesquisas.

O que quer dizer que a Google Trends Query de nenhuma forma pode ser considerada como uma resposta final, determinante ou condicionante que qualquer an�lise que se possa fazer, mas sim pode ser um �timo primeiro passo para o in�cio de uma investiga��o, pode ser um direcionador para entendermos o comportamento de mercado ou de opini�es em certo per�odo do tempo, ou um simples aliado � outras t�cnicas que se desenvolve.

Brincando com esta ideia, vamos ver o que acontece quando olhamos para a mesma pequisa, trocando a localiza��o para USA, ao inv�s do Brasil. 


```r
List_natal_tudo_US <- gtrends(keyword="natal",geo=c("US"),time="all")
plot(List_natal_tudo_US)
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6-1.png)

Ops, acho que n�o era a palavra correta. Este aumento em 2009 e 2010 deve ser uma �poca em que havia muitos brasileiros nos Estados Unidos, ou muitos estadunidenses procurando f�rias nas praias de Natal. [joke]


```r
List_christmass_tudo_US <- gtrends(keyword="Christmass",geo=c("US"),time="all")
plot(List_christmass_tudo_US)
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-1.png)

Vemos um padr�o de comportamento nos gr�ficos da popularidade parecido entre os dois pa�ses, no que se refere � frequencia anual, por�m com uma din�mica diferente, pois enquanto no Brasil vem decrescendo, tendo seu pico no in�cio do per�odo, nos Estados Unidos houve uma oscila��o diferente. 


```r
List_christmass_tudo_US <- gtrends(keyword=c("Natal","Christmass"),geo=c("BR","US"),time="all")
plot(List_christmass_tudo_US)
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-1.png)

Para terminar, vamos comparar palavras diferentes, relativos a datas espec�ficas do ano. 


```r
List_comemorativas <- gtrends(keyword=c("carnaval","pascoa","finados","natal"),geo=c("BR"),time="today+5-y")
plot(List_comemorativas)
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9-1.png)
