#  Algoritmo de Newton para encontrar raices Por: Alejandro Zavala
# 
# Queremos determinar las raices de una funcion por algoritmo de Newton


rm(list = ls())

def_funct <- expression(cos(2*x) - x)

x <- seq(from = -5 , to = 5, by = 0.1)

plot(x,eval(def_funct), col = "blueviolet",type = "l",lty = 1, lwd = 3,
     xlab = "Valor en X", ylab = "Valor evaluado en la función", 
     main = "Algoritmo de Newton")
abline(h = 0, col="coral",lwd = 2)

metodo_Newton <- function(func,p_0,tol)
{
  func_deri <- D(func,'x')
  x <- p_0
    
  df_final <- data.frame()
  iteracion_n <- c(p_0,eval(func))
  df_final <-rbind(df_final,iteracion_n)

  x1 <- x - eval(func)/eval(func_deri)
  
  while (abs(x1-x) > tol)
  {
    x <- x1
    iteracion_n <- c(x,eval(func))
    df_final <-rbind(df_final,iteracion_n)
    
    x1 <- x - eval(func)/eval(func_deri)
  }
  
  colnames(df_final) <- c("p_n","f(p_n)")
  return(df_final)
}

result_opt <- metodo_Newton(def_funct,5.6,0.00000001)
result_opt


abline(v = result_opt$p_n[length(result_opt$p_n)], col="darkgreen",lwd = 2)
