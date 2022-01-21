# Integracion numerica por integración de Romberg Por: Alejandro Zavala
# 
# Aproximación de la integral de funciones por integración de Romberg


rm(list = ls())

func_def <- function(x) 
{
  sin(x) # F(x) = - cos(x)
}

a_beg <- 0
b_end <- pi
n_tot <- 6

x <- seq(from = a_beg, to = b_end, by = 0.1)

plot(x,func_def(x), col = "orangered4",type = "l",lty = 1,lwd = 3,
     xlab = "Valor en X", ylab = "Valor evaluado en la función",
     main=paste("Regla de Simpson con n =",n_tot))


integracion_Romberg <- function(func,a,b,n)
{
  options(digits = 9)
  h <- b-a;
  
  vector_h <- c(1:n)
  vector_h[1] <- h;
  
  matriz_Rkj <- matrix(0,nrow = n, ncol = n)
  matriz_Rkj[1,1] <- (h/2)*(func(a) + func(b))
  
  for (k in 2:n)
  {
    h_k <- h / (2^(k-1))
    vector_h[k] <- h_k
    for (j in 1:k)
    {
      if (j == 1)
      {
        fact_to <- 0;
        for (i in 1:(2^(k-2)))
        {
          fact_to <- fact_to + func( a + ((2*i)-1)*vector_h[k] )
        }
        
        matriz_Rkj[k,j] <- (1/2) * ( matriz_Rkj[k-1,1] + ( vector_h[k-1]* fact_to)) 
      }
      else
      {
        matriz_Rkj[k,j] <- matriz_Rkj[k,j-1] + (1/(4^(j-1) - 1))*(matriz_Rkj[k,j-1] - matriz_Rkj[k-1,j-1])
      }
    }
  }
  return(matriz_Rkj)
}
integracion_Romberg(func_def,a_beg,b_end,n_tot)

