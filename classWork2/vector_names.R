# Урал (Домашние матчи)
ural_home <- c(2, 0, 1, 0)

# Выездные
ural_away <- c(0, 0, 1, 1)
#Напечатайте на консоль оба вектора
ural_home
ural_away
# Назначим имена элеметом вектора (Команды Гости)
names(ural_home) <- c("Ufa", "CSKA", "Arsenal", "Anzhi")
#Проделайте то же самое для вектора ural_away назначив имена команд гостей (away_names)
away_names <- c("Rostov", "Amkar", "Rubin", "Orenburg")
names(ural_away)<-away_names
#Напечатайте на консоль оба вектора, заметьте разницу
ural_away
ural_home
#Посчитайте статистикку домашних и выездных матчей (общее кол-во голов, среднее количество голов)
mean_ural_away<-mean(ural_away)
sum_ural_away<-sum(ural_away)

mean_ural_home<-mean(ural_home)
sum_ural_home<-sum(ural_home)
#среднее кол-во забитых голов дома
mean_ural_home
#среднее кол-во забитых на выезде
mean_ural_away
#общее кол-во забитых дома
sum_ural_home
#общее забитое кол-во на выезде
sum_ural_away
#сравните векторы ural_home и ural_away и сделайте вывод