# Program szyfruje i deszyfruje zahardkowana wiadomosc
# Aes tszyfruje bloki co 16 bitow wiec musimy uzupelnic znaki (funkcja dopelnienie do16)

from Crypto.Cipher import AES
import codecs

def dopelnienie_do16(zmienna):
    result = zmienna + (16-len(zmienna))*']'
    return result

key = b"Sixteen byte key"
cipher = AES.new(key)

text1 = "dupa"
text2 = "siemanko"
text3 = "jacie"

text1 = dopelnienie_do16(text1)
text2 = dopelnienie_do16(text2)
text3 = dopelnienie_do16(text3)


szyfr1 = cipher.encrypt(text1)
szyfr2 = cipher.encrypt(text2)
szyfr3 = cipher.encrypt(text3)


print(szyfr1)
print(szyfr2)
print(szyfr3)


#uzywamy tego samego klucza do dekrypcji (algorytm synchroniczny)
plain1 = cipher.decrypt(szyfr1)
plain2 = cipher.decrypt(szyfr2)
plain3 = cipher.decrypt(szyfr3)


print(plain1)
print(plain2)
print(plain3)
