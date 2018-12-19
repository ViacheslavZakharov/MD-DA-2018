#Модифицируйте код из предыдущей лекции (функцию estimate.scaling.exponent), чтобы он возвращал список a и y0
gmp <- read.table(file="../data/gmp.dat")

gmp$pop <- gmp$gmp / gmp$pcgmp
estimate.scaling.exponent <- function(a, y0=6611, response=gmp$pcgmp,
                                      predictor = gmp$pop, maximum.iterations=100, deriv.step = 1/100,
                                      step.scale = 1e-12, stopping.deriv = 1/100) {
  
  mse <- function(a) { mean((response - y0*predictor^a)^2) }
  for (iteration in 1:maximum.iterations) {
    deriv <- (mse(a+deriv.step) - mse(a))/deriv.step
    a <- a - step.scale*deriv
    if (abs(deriv) <= stopping.deriv) { break() }
  }
  fit <- list(a=a,y0,iterations=iteration,
              converged=(iteration < maximum.iterations))
  return(fit)
}

estimate.scaling.exponent(0.15)
###Напишите рекурсивные функции факториала и фибоначчи

#Рекурсивная ф-ия факториала
rec.factorial<-function(n){
  stopifnot(n>=0)
  if(n==1) {return(1)} 
  else {return(n*rec.factorial(n-1))}
}

#Рекурсивная ф-ия фибоначчи
rec.fibonachi<-function(n){
  stopifnot(n>=0)
  if(n==0) {return(0)}
  if(n==1 || n==2) {return(1)}
  else {return(rec.fibonachi(n-1)+rec.fibonachi(n-2))}
}
