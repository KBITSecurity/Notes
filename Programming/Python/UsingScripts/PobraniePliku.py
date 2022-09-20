import requests

url = 'https://assets.tryhackme.com/img/THMlogo.png'
r = requests.get(url, allow_redirects=True)
pdf1 = requests.get("http://localhost/1-pdf.192")

params = {'user': pdf1.content, 'pass': pdf2.content}

open('THMlogo.png', 'wb').write(r.content)
