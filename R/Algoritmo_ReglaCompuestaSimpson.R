# Integracion numerica por regla compuesta de Simpson Por: Alejandro Zavala
# 
# Aproximación de la integral de funciones por regla compuesta de Simpson 

## Notas: n debe ser entero positivo (por definición)

rm(list = ls())

func_def <- function(x) 
{
  5 * x^2 - (x/3)
}

a_beg <- 1
b_end <- 5
n_tot <- 12

x <- seq(from = a_beg, to = b_end, by = 0.1)

plot(x,func_def(x), col = "orangered4",type = "l",lty = 1,lwd = 3,
     xlab = "Valor en X", ylab = "Valor evaluado en la función",
     main=paste("Regla de Simpson con n =",n_tot))


regla_Simpson <- function(func,a,b,n)
{
  if (n%%2 == 0)
  {
    h <- (b-a)/n
    ter1 <- func(a) + func(b)
    
    c_total <- c(a,b)
    
    ter2 <- 0
    for (j in 1:((n/2) - 1))
    {
      incr <- a + (2*j)*h
      ter2 <- ter2 + 2 * func(incr)
      c_total <- c(c_total,incr)
    }
    
    ter3 <- 0
    for (j in 1:(n/2) )
    {
      incr <- a + (2*j - 1)*h
      ter3 <- ter3 + 4 * func(incr)
      c_total <- c(c_total,incr)
    }
    
    i_aprox <- (h/3) * (ter1 + ter2 + ter3)
    
    return(list(i_aprox,c_total))
  }
  else
  {
    print("N debe ser par")
  }
}

opt <- regla_Simpson(func_def,a_beg,b_end,n_tot)
opt_val <- opt[[1]];print(paste("La integral aproximada con n =",n_tot," es:",opt_val))

abline( v = opt[[2]], col = "seagreen", lwd = 3)


#Veamos una funcion mas compleja

func_def <- function(x) 
{
  sin(exp(x))
}

a_beg <- 0
b_end <- 2
n_tot <- 18

x <- seq(from = a_beg, to = b_end, by = 0.05)

plot(x,func_def(x), col = "palevioletred4",type = "l",lty = 1,lwd = 3,
     xlab = "Valor en X", ylab = "Valor evaluado en la función",
     main=paste("Regla de Simpson con n =",n_tot))

opt <- regla_Simpson(func_def,a_beg,b_end,n_tot)
opt_val <- opt[[1]];print(paste("La integral aproximada con n =",n_tot," es:",opt_val))

abline( v = opt[[2]], col = "paleturquoise4", lwd = 3)
