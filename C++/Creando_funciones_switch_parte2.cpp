#include<iostream>
#include<cmath>
#include<string>

using namespace std; // make names from std visible without std::

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

void switch_use()
{
	int opcion;
	cout << "Ingrese la opcion a ejecutar (0,1 o 2): ";
	cin >> opcion;

	switch(opcion)
	{
	    case 1:
		cout << "Usted ha seleccionado la opcion 1"<<endl;
	    break;
	    case 2:
		cout << "Usted ha seleccionado la opcion 2"<<endl;
	    break;
	    case 3: 
		cout << "Usted ha seleccionado la opcion 3"<<endl;
	    break;
	    default: 
		cout << "Usted ha ingresado una opcion incorrecta"<<endl;
	}
}

void calculadora_propia()
{
	char opcion;
	cout << "Ingrese la letra a ejecutar (ceil - c, sqrt - s, pow - p, ln - l): ";
	cin >> opcion;

	switch(opcion)
	{
		double num; // variable que se ocupara en alguna de las 4 operaciones
		
	    case 'c':
		cout << "Usted ha seleccionado la opcion ceil"<< endl;
		cout << "Ingrese numero"<< endl;
		cin >> num;
		cout << "El techo de " << num << " es: " << ceil(num) << endl;
	    break;
	    
		case 's':
		cout << "Usted ha seleccionado la opcion sqrt"<<endl;
		cout << "Ingrese numero"<< endl;
		cin >> num;
		cout << "ELa raiz de " << num << " es: " << sqrt(num) << endl;
	    break;
	    
		case 'p': 
		cout << "Usted ha seleccionado la opcion pow"<<endl;
		cout << "Ingrese numero"<< endl;
		cin >> num;
		cout << "La potencia cubica de " << num << " es: " << pow(num,3) << endl;
	    break;
	    
		case 'l': 
		cout << "Usted ha seleccionado la opcion ln"<<endl;
		cout << "Ingrese numero"<< endl;
		cin >> num;
		cout << "El logaritmo natural de " << num << " es: " << log(num) << endl;
	    break;
	    
		default: 
		cout << "Usted ha ingresado una opcion incorrecta";
	}
}
int main()
{
	bool program_continue;
	
	cout << "Ejemplos del uso de funcion Switch-Case" << endl;
	
	switch_use();
	
	program_continue = accept();
	
	if (program_continue)
	{
		calculadora_propia();
	}
	else
	{
		exit(0);
	}
	
	
}

