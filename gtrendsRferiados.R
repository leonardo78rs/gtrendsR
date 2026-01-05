# Produção de gráficos com ![R]
## Tópico: Google Trends com R (Usando 1 comando)
  
#install.packages("gtrendsR")
library(gtrendsR)

List_natal <- gtrends(keyword="natal",geo=c("BR"),time="today 3-m")
plot(List_natal)

List_natal_1ano <- gtrends(keyword="natal",geo=c("BR"),time="today 12-m")
plot(List_natal_1ano)

List_natal5anos <- gtrends(keyword="natal",geo=c("BR"),time="today+5-y")
plot(List_natal5anos)

List_natal_tudo <- gtrends(keyword="natal",geo=c("BR"),time="all")
plot(List_natal_tudo)

List_natal_tudo_US <- gtrends(keyword="natal",geo=c("US"),time="all")
plot(List_natal_tudo_US)

List_christmass_tudo_US <- gtrends(keyword="Christmass",geo=c("US"),time="all")
plot(List_christmass_tudo_US)

List_christmass_tudo_US <- gtrends(keyword=c("Natal","Christmass"),geo=c("BR","US"),time="all")
plot(List_christmass_tudo_US)

List_comemorativas <- gtrends(keyword=c("carnaval","pascoa","finados","natal"),geo=c("BR"),time="today+5-y")
plot(List_comemorativas)
