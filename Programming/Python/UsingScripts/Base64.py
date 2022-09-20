#Program jako argument przyjmuje sciezke do pliku z zadekodowanym base64

import base64
import sys

data = open(sys.argv[1]).read()

ilosc = int(input('Ile razy zdekodowac: '))

for i in range(0, ilosc):
    data = base64.b64decode(data)

print(data)
