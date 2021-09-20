#include<iostream>
#include<cmath>

using namespace std; // make names from std visible without std::

int main()
{
	cout << "Calculadora Basica" << "\n";
	
	double a,d;
	int b,c;
	a = 34.43;
	b = 5;
	c = 0;
	d = -45;
	
	cout << "\t\t\t Algunas funciones basicas" << "\n" << endl ;
	cout << "La suma de " << a << " + " << b << " = "<< a+b <<endl;
	cout << "La resta de " << a << " - " << b << " = "<< a-b << endl;
	cout << "El producto de " << a << " * " << b << " = "<< a*b << endl;
	cout << "La division de " << a << " / " << b << " = "<< a/b << endl;
	
	// Funciones integradas de la libreria math.h o cmath
	cout << "\t\t\t Algunas funciones de la libreria math.h o cmath" << "\n" << endl ;
	cout << "La potencia de  " << 3.3 << " ^ " << 3 << " = "<< pow(3.3, 3) << endl;
	cout << "La raiz cuadrada de  " << 50 << " = "<< sqrt(50) << endl;
	cout << "La raiz cubica de  " << 50 << " = "<< cbrt(50) << endl;
	
	cout << "El suelo de " << 55.36 << " es " << floor(55.36) << endl;
	cout << "El suelo de " << -55.36 << " es " << floor(-55.36) << endl;
	
	cout << "El techo de " << 55.95 << " es " << ceil(55.95) << endl;
	cout << "El techo de " << 55.36 << " es " << ceil(55.36) << endl;
	cout << "El techo de " << -55.36 << " es " << ceil(-55.36) << endl;
	
	cout << "El redondeo de " << 55.95 << " es " << round(55.95) << endl;
	cout << "El redondeo de " << 55.36 << " es " << round(55.36) << endl;
	cout << "El redondeo de " << -55.36 << " es " << round(-55.36) << endl;
	
	cout << "El valor absoluto de " << 55.36 << " es " << abs(55.36) << endl;
	cout << "El valor absoluto de " << -55.36 << " es " << abs(-55.36) << endl;
	
	// Algunas constantes importantes
	cout << "\t\t\t Algunas constantes importantes" << "\n" << endl ;
	cout << "El valor de pi: " << M_PI << endl;
	cout << "El calor de exponencial: " << M_E << endl;
	
	// Funcion exponencial
	cout << "\t\t\t Algunas funciones importantes" << "\n" << endl ;
	cout << "Exponencial elevado a: " << 3 << " = " << exp(3) << endl;
	cout << "El logaritmo natural de 35 es : " << log(35) << endl;
	cout << "El logaritmo base 10 de 1000000 es : " << log10(1000000) << endl;
	
	// Algunas funciones trigonometricas (estan en radianes)
	
	cout << "Convirtiendo a radianes" << "\n" << endl;
	cout << 180 << " grados a radianes es: " << 180*(2*M_PI/360)<< endl;
	cout << 45 << " grados a radianes es: " << 45*(2*M_PI/360)<< endl;
	
	cout << "Convirtiendo a grados" << "\n" << endl;
	cout << M_PI_2 << " radianes a grados es: " << M_PI_2*(360/(2*M_PI))<< endl;
	cout << M_PI_4 << " radianes a grados es: " << M_PI_4*(360/(2*M_PI))<< endl;
	
	cout << "\t\t\t Algunas funciones trigonometricas" << "\n" << endl ;
	cout << "El seno de " << M_PI_2 << " = " << sin(M_PI_2)<< endl;
	cout << "El coseno de " << M_PI_2 << " = " << cos(M_PI_2)<< endl;
	cout << "El arcotangente de " << M_PI_2 << " = " << atan(M_PI_2)<< endl;
}

