#Загрузите данные о землятресениях
anss <- readLines("https://raw.githubusercontent.com/SergeyMirvoda/MD-DA-2017/master/data/earthquakes_2011.html", warn=FALSE)
#Выберите строки, которые содержат данные с помощью регулярных выражений и функции grep
a <- grep("\\d{4}(.\\d{2}){2}\\s(\\d{2}:){2}\\d{2}.\\d{2}",anss)
#(
options(max.print = 3000)
#anss[a]
#Проверьте что все строки (all.equal) в результирующем векторе подходят под шаблон.
data<-anss[11:(length(anss)-2)]
#проверка что совпадает с данными
all.equal(anss[a],data)

