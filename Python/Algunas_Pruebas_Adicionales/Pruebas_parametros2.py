import argparse
from datetime import date

my_parser = argparse.ArgumentParser(prog = "Prueba de múltiple parámetros", #name of the program
                                    usage = "%(prog)s [option]", #additional usage info
                                    description = "Prueba de envio correcto con argparse", #description
                                    epilog = "Epilogo de prueba", #epilog, after help message
                                    prefix_chars = "-")  #in case you want other prefix

my_parser.add_argument("name_usr", metavar = "n_s", type = str, help = "name need")
my_parser.add_argument("name_aka", metavar = "n_a", type = str, help = "alias needed")
my_parser.add_argument("pass_str", metavar = "p_s", type = str, help = "pass to access")
my_parser.add_argument("date_now", metavar = "d_n", type = str, help = "date format DDMMYYYY")


#Execute parse_args() method
args = my_parser.parse_args()

user_name = args.name_usr
alias_name = args.name_aka
pass_access = args.pass_str
date_int = args.date_now

print("Welcome {} a.k.a {}".format(user_name,alias_name))

if pass_access == "Red2022":
    print("######## Access granted: ########")
    print("Your date input is: {}".format(date_int))
    print("Date now: {}".format(date.today()))
else:
    print("######## Access Denied: ########")


# Try python Pruebas_parametros2.py -help