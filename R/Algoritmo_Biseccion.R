#  Algoritmo de bisección By: Alejandro Zavala
# 
# Aproximaremos raices de una ecuacion en una variable implementando el método de bisección
# El siguiente algoritmo funciona bajo la supocisión de metodo de cambio de signo

# Ingresar la funcion a encontrar una raiz
funct_dada <- function(x)
{
  return(x^3 + 4 * x^2 - 10)
}

interval <- -10:10

plot(interval,funct_dada(interval), col = "darkcyan",type = "l",lty = 1, lwd = 3,
     xlab = "Valor en X", ylab = "Valor evaluado en la función", 
     main = "Función a encontrar su raiz")
abline(h = 0, col="darkmagenta",lwd = 2)

metodo_biseccion <- function(func,a,b)
{
  tolerancia_error = 0.001
  if((func(a)<0 && func(b)>0) || (func(a)>0 && func(b)<0) )
  {
    #Obligamos de todas formas a mostrar la primera iteracion
    f_an <- func(a)
    f_bn <- func(b)
    pn <- (a+b)/2
    f_pn <- func(pn)
    iteracion_n <- c(a,b,pn,f_pn)
    data_f<-data.frame()
      # "an"=double(), #no sirve ni idea
      #                  "bn"=numeric(),
      #                  "pn"=numeric(),
      #                  "f(pn)" = numeric())
    data_f <-rbind(data_f,iteracion_n)
    while (abs(f_pn) > tolerancia_error) 
    {
      if(f_an*f_pn > 0)
      {
        a <- pn
      }
      else
      {
        b <- pn
      }
      
      f_an <- func(a)
      f_bn <- func(b)
      pn <- (a+b)/2
      f_pn <- func(pn)
      iteracion_n <- c(a,b,pn,f_pn)
      data_f <-rbind(data_f,iteracion_n)
    }
    colnames(data_f) <- c("a_n","b_n","p_n","f(p_n)")
    return(data_f)
  }
  else
  {
    print("No es posible encontrar raiz en el intervalo dado, o raiz ha sido encontrada")
  }
}

result_opt <- metodo_biseccion(funct_dada,1,2)
result_opt
abline(v = result_opt$p_n[length(result_opt$p_n)], col="darkgreen",lwd = 2)
