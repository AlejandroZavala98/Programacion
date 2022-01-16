# Integracion numerica por trapecios compuestos Por: Alejandro Zavala
# 
# Aproximacion de la integral de funciones por el método de trapecios compuestos

rm(list = ls())

func_def <- function(x) 
{
  x^2
}

a_beg <- 0
b_end <- 1
n_tot <- 10

x <- seq(from = a_beg, to = b_end, by = 0.1)

plot(x,func_def(x), col = "purple4",type = "l",lty = 1,lwd = 3,
     xlab = "Valor en X", ylab = "Valor evaluado en la función",
     main=paste("Metodo de trapecios compuestos con n=",n_tot))


# Formula en latex
# 
# $$ \int_{a}^{b} f(x) dx = \frac{h}{2} \left[ f(a) + 2f(a+h) + 2f(a+2h) + ... + f(b) \right] $$
#   
# $$ h = \frac{b-a}{n} $$ 
#   
# $$ \int_{a}^{b} f(x) dx = \frac{b-a}{n} \left[  \frac{f(a) + f(b)}{2} + \sum_{k=1}^{n-1} f \left( a + kh\right) \right] $$

metodo_trapecio <- function(func,a,b,n)
{
  x_val <- c(a)
  f_val <- c(func(a))

  h <- (b-a)/n
  aprox <- (func(a) + func(b))/2
  
  print(paste("Valor de h",h))
  
  for (k in (1:(n-1)))
  {
    #print(paste("Valor de k: ",k))
    incr <- a + k*h
    #print(paste("Valor del incremento en x: ",incr))
    aprox <- aprox + func(incr)
    
    x_val <- c(x_val,incr)
    f_val <- c(f_val,func(incr))
  }
  
  opt <- h*aprox
  x_val <- c(x_val,b)
  f_val <- c(f_val,func(b))
  
  df_final <- data.frame("x" = x_val,
                         "f(x)" = f_val)
  
  return(list(opt,df_final))
}

opt <- metodo_trapecio(func_def,a_beg,b_end,n_tot)
opt_val <- opt[[1]];print(paste("Valor de la integral aproximado",opt_val))
opt_df <- opt[[2]];opt_df

points(opt_df$x,opt_df$f.x.,type = "l",lty = 1,col = "red4",lwd=2)
abline( v = opt_df$x,col = "green4",lwd=2)


#Veamos una funcion mas compleja

func_def <- function(x) 
{
  x / exp(x^2)
}

a_beg <- -1
b_end <- 2
n_tot <- 10

x <- seq(from = a_beg, to = b_end, by = 0.1)

plot(x,func_def(x), col = "purple4",type = "l",lty = 1,lwd = 3,
     xlab = "Valor en X", ylab = "Valor evaluado en la función",
     main=paste("Metodo de trapecios compuestos con n=",n_tot))

opt <- metodo_trapecio(func_def,a_beg,b_end,n_tot)
opt_val <- opt[[1]];print(paste("Valor de la integral aproximado",opt_val))
opt_df <- opt[[2]];opt_df

points(opt_df$x,opt_df$f.x.,type = "l",lty = 1,col = "red4",lwd=2)
abline( v = opt_df$x,col = "green4",lwd=2)
