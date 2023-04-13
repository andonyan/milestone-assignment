from datetime import datetime
import time
import os


def print_system_time():
    output_file = open('C:\\system_time\\system_time.txt', 'a')
    print(datetime.now().strftime('%d.%m.%Y %H:%M:%S'), file=output_file)
    output_file.close()


if os.path.exists('C:\\system_time'):
    while True:
        print_system_time()
        time.sleep(5)
else:
    os.makedirs('C:\\system_time')
    while True:
        print_system_time()
        time.sleep(5)
