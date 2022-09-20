#Script pobiera co 8 znakow i dekoduje na system dziesietny

with open('creds_decode', 'w') as credsout, open('creds', 'r') as credsin:
    r = credsin.read()
    b = ' '.join([r[i:i+8] for i in range(0, len(r), 8)])
    credsout.write(''.join([chr(int(c, 2)) for c in b.split(' ')]))
