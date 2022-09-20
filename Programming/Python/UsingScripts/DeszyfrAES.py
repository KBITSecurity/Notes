#Program przyjmuje ciag base64 dekoduje go a nasetpnie deszyfruje wedlug podanego klucza

from Crypto.Cipher import AES
import base64

def uzupelnij(zmienna):
    result = zmienna + (16-len(zmienna))*']'
    return result


szyfr = input("Podaj szyfr: ")
klucz = input("Podaj klucz: ")


szyfr = base64.b64decode(szyfr)

klucz = uzupelnij(klucz)

aes = AES.new(klucz)

plain = aes.decrypt(szyfr)

print(plain)
