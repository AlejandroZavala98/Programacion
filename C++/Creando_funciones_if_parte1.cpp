#include<iostream> // Algunas funciones de entrada salida 
#include<cmath> // Algunas funciones matematicas

using namespace std; // make names from std visible without std::

double square_5(double x) // raiz cuadrada mas 5 (regresa un valor, en este caso double)
{
return pow(x,2)+5;
}

void print_square_5(double x) // void indica que esta funcion no regresa un valor
{
cout << "La raiz cuadra de  " << x << " mas 5 es " << square_5(x) << "\n";
}

bool accept()
{
	cout << "¿Quieres proceder (y or n)?\n"; // escribiendo una pregunta
	char answer;
	cin >> answer; // lee la respuesta
	if (answer == 'y') 
	{
		return true;
	}
	else
	{
		return false;
	}
}

bool verificar_calif(double score)
{
	if (score>=0 && score <=10)
	{
		return true;
	}
	else
	{
		return false;
	}
}

bool score_test(double score)
{
	if (score < 6)
	{
		return false;
	}
	else
	{
		return true;
	}
} 

int main()
{
	double number_power,score_math;
	bool program_continue, pass_test, verificar_score;
	cout << "\t\t\tCreando algunas funciones" << "\n";
	
	cout << "Ingresa el numero que se le hara potencia cuadrada y se le sumara 5 unidades: ";
	cin >> number_power;
	print_square_5(number_power); // Imprime un resultado (no regresa algun valor)
	
	program_continue = accept();
	if (program_continue)
	{
		cout << "Ingresa tu calificacion en matematicas (0 a 10): ";
		cin >> score_math;
		verificar_score = verificar_calif(score_math);
		if (verificar_score)
		{
			pass_test = score_test(score_math);
			if (pass_test)
			{
				cout << "Pasaste la materia";
			}
			else
			{
				cout << "No pasaste la materia";
			}	
		}
		else
		{
			cout << "Calificacion invalida para mi";
		}		
	}
	else
	{
		exit(0);
	}
	
	
}


