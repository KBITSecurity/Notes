#Program pobiera tekst od uzytkownika hashuje go md5 i wysiwetla na ekranie
#Nastepnie prosi o podanie sciezki do slownika
#Nastepnie podajemy hash do lamania
#Program wykonuje dictionary attack na podany hash przy urzyciu podanego slownika
#Opcja dla sha256 wymaga zmiany komentarza w kodzie

import hashlib
import pyfiglet

ascii_banner = pyfiglet.figlet_format("Hackeru")
print(ascii_banner)

text_jawny = input("Podaj dane do hashowania[md5]: ")
text_code = hashlib.md5(text_jawny.strip().encode())
print(text_code)
text_code = text_code.hexdigest()
print(text_code)



wordlist_location = str(input("Enter wordlist file location: "))
hash_input = str(input("Enter hash to be cracked: "))

with open(wordlist_location, 'r') as file:
    for line in file.readlines():
        hash_ob = hashlib.md5(line.strip().encode())
        # hash_ob = hashlib.sha256(line.strip().encode())
        hashed_pass = hash_ob.hexdigest()
        if hashed_pass == hash_input:
            print("Found cleartext password! " + line.strip())
            exit(0)
