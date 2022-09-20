#Program pobiera widomosc i klucz od uzytkownika
#Szyfruje dane i koduje do base64


from Crypto.Cipher import AES
import codecs
import base64

def uzupelnij(zmienna):
    result = zmienna + (16-len(zmienna))*']'
    return result

wiadomosc = input("Podaj wiadomosc: ")
klucz = input("Podaj klucz: ")

klucz = uzupelnij(klucz)
wiadomosc = uzupelnij(wiadomosc)

aes = AES.new(klucz)

szyfr = aes.encrypt(wiadomosc)
szyfr_base64 = base64.b64encode(szyfr)
pokaz = str(szyfr_base64).split("'")
print(pokaz[1])
