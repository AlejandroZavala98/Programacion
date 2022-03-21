library(boot) # Programación lineal
library(lpSolve) # Programación lineal entera


# Para resolver

# max c^{T}x
# s.a AX < b
# x >= 0

rm(list=ls()) # Limpiamos el entorno

vector_c <- c(80,45) # funcion objetivo
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
sol_simplex$value # equivalente a  sum(mySimplex$soln*vector_c)

# Ahora para resolver

# max c^{T}x
# s.a AX < b
# x >= 0 enteros


restricciones <- c("<=","<=","<=")
int_sol <- c(1,2)

int_solution <- lp(direction = "max",
                   objective.in = vector_c,
                   const.mat = matrix_A,
                   const.dir = restricciones,
                   const.rhs = vector_b,
                   int.vec = int_sol, all.int = TRUE)

int_solution$solution # Solucion al problema con resultados enteros
int_solution$objval # equivalente a  sum(int_solution$solution*vector_c)




