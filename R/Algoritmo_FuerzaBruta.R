#  Algoritmo de fuerza bruta By: Alejandro Zavala
# 
# Queremos determinar el minimo de una función, recorriendo todas las alternativas posibles
# y evaluando la mejor, tenemos una funcion que tomara valores en un intervalo que le demos,
# y por medio de un algoritmo veremos cual es el valor minimo entero recorrido


rm(list = ls())

func_cuadrada <- function(x)
{
  return((-x+10)^2-20)
}

interval <- -100:100

plot(interval,func_cuadrada(interval), col = "red",type = "l",lty = 2, lwd = 3,
     xlab = "Valor en X", ylab = "Valor evaluado en la función", 
     main = "Algoritmo de fuerza bruta")

fuerza_bruta <- function(funct, min_x , max_x)
{
  menor_valor<- funct(min_x)
  valor_objetivo <- min_x
  for (itera in (min_x+1):max_x)
    {
    valor_actual <- funct(itera)
    if(valor_actual < menor_valor){
      menor_valor <- valor_actual
      valor_objetivo <- itera
    }
  }
  
  resultado <- data.frame(valor_objetivo, menor_valor)
  names(resultado) <- c("Solución", "Valor Objetivo")
  return(resultado)
}

resultado_objetivo <- fuerza_bruta(func_cuadrada,-100,100)
resultado_objetivo

# plot(interval,func_cuadrada(interval), col = "red",type = "l",lty = 2, lwd = 3,
#      xlab = "Valor en X", ylab = "Valor evaluado en la función", 
#      main = "Algoritmo de fuerza bruta")
abline(v = resultado_objetivo$Solución, col="blue",lwd = 2)
abline(h = resultado_objetivo$`Valor Objetivo`, col="blue",lwd = 2)
