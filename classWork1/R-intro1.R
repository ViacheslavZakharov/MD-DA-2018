1234+4567
29-45
325/25
56*12
11*11
111*111
1111111*1111111
options(width=40)
5:32
1:10
(1:10)+103
(1:10)*6
(1:10)^4
39%/%4
x <-c(4, 1, 8, 9)
y <-c(6, 2, 4, 3)
plot(x,y)
lines(x,y)
x<- 1:10
y<-2^x
plot(x,y)
lines(x,y)
learn <-c("stats" = 15, "math"= 10,"programming" = 30, "attempts" = 45)
pie(learn)
barplot(learn)
Z<-rnorm(10000)
hist(Z, prob = TRUE, main = "Гистограмма относительной частоты",
     sub = "Плотность распределения")
curve(dnorm(x), from = -3, to = 3, add = TRUE, col = "red")
