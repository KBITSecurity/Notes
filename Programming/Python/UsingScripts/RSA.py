#Program generuje pare kluczy prywatny i publiczny i zapisuje do pliku
#Wczytuje te klucze i pobiera od uzytkownika wiadomosc do zaszyfrowania
#Robi z niej skrot sha1 i szyfruje kluczem publicznym
#Nastepnie deszyfruje kluczem prywatnym i sprawdza hashe (pokazuje ok jezeli haseh sie zgadzaja)
#Na koncu wyswietla odszyfrowana wiadomosc

import rsa

def generate_keys():
    (pubKey, privKey) = rsa.newkeys(1024)
    with open('keys_pub.pem', 'wb') as f:
        f.write(pubKey.save_pkcs1('PEM'))

    with open('keys_priv.pem', 'wb') as f:
        f.write(privKey.save_pkcs1('PEM'))

def load_keys():
    with open('keys_pub.pem', 'rb') as f:
        pubKey = rsa.PublicKey.load_pkcs1(f.read())

    with open('keys_priv.pem', 'rb') as f:
        privKey = rsa.PrivateKey.load_pkcs1(f.read())

    return pubKey, privKey

def encrypt(msg, key):
    return rsa.encrypt(msg.encode('ascii'), key)

def decrypt(ciphertext, key):
    try:
        return rsa.decrypt(ciphertext, key).decode('ascii')
    except:
        return False

def sign_sha1(msg, key):
    return rsa.sign(msg.encode('ascii'), key, 'SHA-1')

def verify_sha1(msg, signature, key):
    try:
        return rsa.verify(msg.encode('ascii'), signature, key) == 'SHA-1'
    except:
        return False

generate_keys();
pubKey, privKey = load_keys()

message = input("Enter a message: ")

#Tworzymy sygnature wiadomosci w postaci skrutu sha1 i szyfrujemy wiadomosc kluczem publicznym
ciphertext = encrypt(message, pubKey)
signature = sign_sha1(message, privKey)

#Deszyfrujemy zaszyfrowana wiadomosc kluczem prywatnym
plaintext = decrypt(ciphertext, privKey)

#Weryfikujemy poprawnosc danych jezeli zgadzaja sie skroty sha1 to jest ok
if verify_sha1(plaintext, signature, pubKey):
    print("OK")
else:
    print("Uuuuuuuuu lalala")


print("Message: {}".format(plaintext))
