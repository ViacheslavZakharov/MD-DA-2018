#Введение в R. Самостоятельная работа
a<- 11111111
b<-a^2
d<-b*1111111
d
#Найдите площади примоугольников с длинами (3,7,12,15, 20) и ширинами (2, 5,8,11,15)
#Постройте график этих длин и ширин
arrayLengths<-c(3,7,12,15, 20)
arrayWidths<-c(2,5,8,11,15)
arraySquare<-arrayLengths*arrayWidths
arraySquare
plot(arrayLengths,arrayWidths,xlab="length",ylab="width")
#Первокурсник Вася тратит очень мног овремени на домашнюю работу.
#40 минут на математику, 40 на английский, 10 на физкультуру и 150 минут
#на программирование. Постройте график.
vasy<-c("math"=40,"english"=40,"piscult"=10,"programming"=150)
pie(vasy)
#Напитки разливаются вручную в банки по 455 мл, количество налитого
#нормально распределено со средним значением 450 мл. и стандартным
#отклонением 4 мл. Чтобы смоделировать количество разлитого в 5 банок
#напишем следующий алгорим:
n1<-5
drinks<-rnorm(n1,mean=450,sd=4)
drinks
n2<-10000
drinksModel<-rnorm(n2,mean=450,sd=4)
t<-table(drinksModel>455)
probability<-t[2]/n2
probability
