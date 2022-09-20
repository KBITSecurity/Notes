import zlib
s = '44.zlib'
z = zlib.compress(s)
with open('dane', 'w') as f:
    f.write(z)





#Dekompresja:
import zlib

plik = open('29.zlib', 'rb')
dane = plik.read()

nowy = open('wynik', 'wb')


tekst = zlib.decompress(dane)
nowy.write(tekst)
