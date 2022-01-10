#  Algoritmo de Punto fijo By: Alejandro Zavala
# 
# Algoritmo de punto fijo para encontrar las soluciones de las ecuaciones en una variable


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

metodo_punto_fijo <- function(func,p_0,tol)
{

  pn <- p_0
  f_pn <- func(pn)
  iteracion_n <- c(pn,f_pn)
  data_f<-data.frame()
  
  data_f <-rbind(data_f,iteracion_n)
  
  while (abs(f_pn-pn) > tol)
  {
    pn <- f_pn
    f_pn <- func(pn)
    iteracion_n <- c(pn,f_pn)
    data_f <-rbind(data_f,iteracion_n)
  }
  colnames(data_f) <- c("p_n","f(p_n)")
  return(data_f)
}


result_opt <-metodo_punto_fijo(trasnf_func,p_0 = 2.71, tol = 0.001)
result_opt

abline(v = result_opt$`f(p_n)`[length(result_opt$`f(p_n)`)], col="darkgreen",lwd = 2)
