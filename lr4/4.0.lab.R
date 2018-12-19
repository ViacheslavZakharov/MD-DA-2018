#Пользуясь примером из лекции файл (5.0.R) проанализируйте данные
#о возрасте и физ. характеристиках молюсков
#https://archive.ics.uci.edu/ml/datasets/abalone
data <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data", header=TRUE, sep=",")
summary(data)
colnames(data)
colnames(data) <- c("sex", "length", "diameter", "height", 
                "whole_weight", "shucked_weight",
                "viscera_weight", "shell_weight", "rings")
#whole_weight->вес целиком
#shucked_weight-> вес очищенного
#viscera_weight->вес внутренних органов
#shell_weight->вес раковины
#infant->младенец

colnames(data)
data$sex <- factor(c("Female", "Infant", "Male")[data$sex])
par(mfrow=c(1,3)) 
hist(data$diameter, main = "Диаметр, мм")
hist(data$height, main = "Высота, мм")
hist(data$whole_weight, main = "Полный вес, гр")
#Видим ассиметрию https://en.wikipedia.org/wiki/Skewness
#и выбросы (от них нужно избавиться)

#Визулизируем возможные зависимости
par(mfrow=c(1,2)) 
plot(data$diameter, data$whole_weight,'p',main = "Зависимость веса от диаметра")
plot(data$height, data$whole_weight,'p',main = "Зависимость веса от высоты")

#Хорошо видна зависимость, нужно её исследовать
#построить линейные модели при помощи функции lm, посмотреть их характеристики

#Линейная модель веса против диаметра молюска
linear.model.1 <- lm (whole_weight ~ diameter , data=data)
linear.model.1
summary(linear.model.1)
plot(linear.model.1)

#Линейная модель веса против высоты
par(mfrow=c(2,2))
linear.model.2 <- lm (whole_weight ~ height, data=data)
linear.model.2
summary(linear.model.2)
plot(linear.model.2)


#избавиться от выборосов, построить ещё модели и проверить их


# Линейная зависимость веса от высоты и диаметра без выбросов
par(mfrow=c(2,2))
data.without.outlier<-data[data$whole_weight<=2.2 & data$diameter<=0.6 & data$diameter>=0.1 & data$height<=0.4 & data$height>=0.04 & data$length<=0.73,]
linear.model.3<-lm(whole_weight ~ +height+diameter,data=data.without.outlier)
linear.model.3
summary(linear.model.3)
plot(linear.model.3)

####Проверка на то, все ли выбрасы были убраны
par(mfrow=c(1,4)) 
hist(data.without.outlier$diameter, main = "Диаметр, мм")
hist(data.without.outlier$height, main = "Высота, мм")
hist(data.without.outlier$whole_weight, main = "Полный вес, гр")
hist(data.without.outlier$length, main="Длина")

par(mfrow=c(2,2))
#Линейная зависимость веса от высоты без выбросов
linear.model.3a<-lm(whole_weight ~ height, data=data.without.outlier)
linear.model.3a
summary(linear.model.3a)
plot(linear.model.3a)

#Линейная зависимость веса от диаметра без выбросов
linear.model.3b<-lm(whole_weight ~ diameter, data=data.without.outlier)
linear.model.3b
summary(linear.model.3b)
plot(linear.model.3b)


# Зависимость веса от всех параметров, кроме калонок, связанных с весом(с раковиной, без раковины, самой раковины)
linear.model.all.parameters<-lm(whole_weight ~ . -shucked_weight -viscera_weight -shell_weight,data=data.without.outlier)
linear.model.all.parameters
summary(linear.model.all.parameters)
plot(linear.model.all.parameters)

#разделить массив данных на 2 случайные части
data.noout<-data.without.outlier
odds<-seq(from=1,to=nrow(data.noout),by=2)
data.odd.half<-data.noout[odds,]
data.even.half<-data.noout[-odds,]

#подогнать модель по первой части
linear.model.odd.half<-lm(whole_weight ~ . -shucked_weight -viscera_weight -shell_weight,data=data.odd.half)
linear.model.odd.half
summary(linear.model.odd.half)
plot(linear.model.odd.half)

par(mfrow=c(1,1))
#спрогнозировать (функция predict) значения во второй части
data.predict<-predict(linear.model.odd.half,data.even.half)
plot(data.even.half$whole_weight,data.predict)

#проверить качество прогноза
cor(data.even.half$whole_weight,data.predict)
