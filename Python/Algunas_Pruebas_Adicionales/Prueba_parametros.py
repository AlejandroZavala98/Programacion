import sys


user_name = sys.argv[1]
pass_security = sys.argv[2]
print ('Welcome {}'.format(user_name))
if pass_security == 'Rojo2022':
    print('Access granted')
else:
    print('Access denied')