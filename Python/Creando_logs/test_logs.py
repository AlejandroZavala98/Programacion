import logging
import time
import math

logger = logging.getLogger('script_test')  
logger.setLevel(logging.INFO)
file_handler = logging.FileHandler(filename='sample.log',mode='w', encoding='UTF-8')
formatter = logging.Formatter('[%(levelname)s] %(asctime)s -> %(message)s')
file_handler.setFormatter(formatter)
logger.addHandler(file_handler)

def log_title(title_py=''):
    logger.info('-------------------------------------------------------------')
    logger.info('\t \t {}'.format(title_py))
    logger.info('-------------------------------------------------------------')


log_title(title_py = 'Cálculando logaritmos')

logger.info('############## Inicio de programa ##############')


number_logs = [5,4,3,2,1,0,-1]
logs_number = []
for un_number in number_logs:
    time.sleep(1)
    try:
        logs_number.append(math.log(un_number))
    except:
        logger.info('No se puede calcular el logaritmo de: {}'.format(un_number))
        logs_number.append('Fail')
        time.sleep(0.5)
