# Programación lineal

# max c^{T}x
# s.a AX < b
# x >= 0

library(boot)

rm(list=ls()) # Limpiamos el entorno

vector_c <- c(80,45) # funcion objetivo (vector c)
vector_c

vector_b <- c(7,60,3) # valores del vector b

condicion_a <- c(1,1)
condicion_b <- c(12,5)
condicion_c <- c(0,1)

matrix_A <- rbind(condicion_a, condicion_b, condicion_c) # Matrix de restricciones
matrix_A


sol_simplex <- simplex(a = vector_c,
                       A1 = matrix_A, 
                       b1 = vector_b,
                       maxi = TRUE )

sol_simplex$soln # Solucion al problema de maximizacion
sol_simplex$value # equivalente a  sum(sol_simplex$soln * vector_c)
sum(sol_simplex$soln * vector_c)




