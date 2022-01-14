# Algoritmo de método de la secante By: Alejandro Zavala
#
# Algoritmo de punto fijo para encontrar las soluciones de las ecuaciones en una variable usando
# el método de la secante. siendo una de las extrensiones del metodo de Newton

rm(list = ls())

func_dada <- function(x)
{
  sin(x/3) - 6*exp(-2*x)
}

interval <- seq(0,5,0.05)

plot(interval,func_dada(interval), col = "forestgreen", type = "l", lty = 1, lwd = 3,
     xlab = "Valor en X", ylab = "Valor evaluado en la función", 
     main = "Método de la secante")
abline(h = 0, col="darkorchid4",lwd = 2)

metodo_secante <- function(func,p_0,p_1,tol)
{
  
  p_2 <- p_1 - ( ( func(p_1)* (p_1 - p_0)) / (func(p_1) - func(p_0)) ) 
  
  
  f_pn <- func(p_2)
  iteracion_n <- c(p_2,f_pn)
  
  data_f <- data.frame()
  data_f <- rbind(data_f,iteracion_n)
  
  while (abs(p_2-p_1) > tol)
  {
    p_0 <- p_1
    p_1 <- p_2
    p_2 <- p_1 - ( ( func(p_1)* (p_1 - p_0)) / (func(p_1) - func(p_0)) ) 
    f_pn <- func(p_2)
    iteracion_n <- c(p_2,f_pn)
    data_f <-rbind(data_f,iteracion_n)
  }
  colnames(data_f) <- c("p_n","f(p_n)")
  return(data_f)
}

result_opt <-metodo_secante(func_dada,p_0 = 0, p_1 = 3, tol = 0.0001)
result_opt

abline(v = result_opt$p_n[length(result_opt$p_n)], col="orangered4",lwd = 2)
