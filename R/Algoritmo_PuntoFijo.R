#  Algoritmo de Punto fijo By: Alejandro Zavala
# 
# Queremos determinar el minimo de una función, recorriendo todas las alternativas posibles
# y evaluando la mejor, tenemos una funcion que tomara valores en un intervalo que le demos,
# y por medio de un algoritmo veremos cual es el valor minimo entero recorrido


rm(list = ls())

func_dada <- function(x)
{
  return(log(x)+ 2 - x)
}

interval <- seq(0,5,0.05)

plot(interval,func_dada(interval), col = "blueviolet",type = "l",lty = 1, lwd = 3,
     xlab = "Valor en X", ylab = "Valor evaluado en la función", 
     main = "Algoritmo de punto fijo")
abline(h = 0, col="coral",lwd = 2)

trasnf_func <- function(x)
{
  return(log(x)+2)
}

metodo_punto_fijo <- function(func,p_0)
{
  tolerancia_error <- 0.001

  
  pn <- p_0
  f_pn <- func(pn)
  iteracion_n <- c(pn,f_pn)
  data_f<-data.frame()
  
  # "an"=double(), #no sirve ni idea
  #                  "bn"=numeric(),
  #                  "pn"=numeric(),
  #                  "f(pn)" = numeric())
  data_f <-rbind(data_f,iteracion_n)
  
  while (abs(f_pn-pn) > tolerancia_error)
  {
    pn <- f_pn
    f_pn <- func(pn)
    iteracion_n <- c(pn,f_pn)
    data_f <-rbind(data_f,iteracion_n)
  }
  colnames(data_f) <- c("p_n","f(p_n)")
  return(data_f)
}


result_opt <-metodo_punto_fijo(trasnf_func,2.71)
result_opt

abline(v = result_opt$`f(p_n)`[length(result_opt$`f(p_n)`)], col="darkgreen",lwd = 2)
