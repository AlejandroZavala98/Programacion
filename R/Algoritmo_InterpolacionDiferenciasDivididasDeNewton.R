## Programa de interpolacion de Newton (Diferencias divididas)

# Para ejecutar este script se requiere un archivo en csv de preferencia, teniendo 2 columnas, la de x y la f(x) x se ordeara con la primera linea suponiendo sea x

rm(list = ls())

df_insumo <- read.csv(file = "C:/Users/Alejandro Zavala/Zavala_Programas/Repositorios_Git/Programacion/R/Insumos/Insumo_Interpolacion3.csv",
                      header = TRUE,
                      sep = ",")

df_insumo

df_insumo <- df_insumo[order(df_insumo[,1]), ]

df_insumo
View(df_insumo)

names(df_insumo)

matrix_DifDivNewton <- function(df)
{
  n_tot <- dim(df)[1]
  
  nrow_mat <- n_tot
  ncol_mat <- n_tot + 1
  
  mat_Dif <- matrix(data = 0,nrow = nrow_mat,ncol = ncol_mat)
  
  mat_Dif[,1] <- df[,1]
  mat_Dif[,2] <- df[,2]
  
  mat_Dif

  for(j in 3:ncol_mat)
  {
    for (i in (j-1):nrow_mat)
    {
      mat_Dif[i,j] <- (mat_Dif[i,j-1] - mat_Dif[i - 1,j-1] )/ ( mat_Dif[i,1] - mat_Dif[i - (j-2),1])
    }
  }
  
  return(mat_Dif)
}

mat_Inter <- matrix_DifDivNewton(df_insumo)
mat_Inter

polinomioInterpolado <- function(mat_IN,x_val)
{
  n_tot <- dim(mat_IN)[1]
  
  mat_x <- mat_IN[,1]
  mat_coef <- mat_IN[,-1]
  
  poli <- mat_coef[1,1]
  
  for (i in 2:n_tot)
  {
    vector_x <- x_val - mat_x[1:(i-1)]
    prod_coef <- prod(vector_x)
    multi_coef_prod <- mat_coef[i,i] * prod_coef
    
    poli <- poli +multi_coef_prod
  }
  return(poli)
}



x_to_plot <- seq(from = min(df_insumo[,1]), to = max(df_insumo[,1]),by=0.1)
y_to_plot <- c()
for (valor in x_to_plot)
{
  y_to_plot <- c(y_to_plot,polinomioInterpolado(mat_Inter,valor))
}

y_to_plot


plot(df_insumo[,1],df_insumo[,2], col = "blueviolet",lty = 1, lwd = 3,
     xlab = "Valor en X", ylab = "Valor evaluado en la función", 
     main = "Interpolación de Newton")
points(x_to_plot,y_to_plot)
