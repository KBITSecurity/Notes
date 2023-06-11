# Tunelowanie
```bash
ssh -N -T -L 0.0.0.0:445:target-machine:445 login@target
```
# Opis flag
![](sshOpisFlag.png)


# Info - wczesniejsze
### Example 1
Tunelowanie w przód używa flagi -L, używanej głównie do tunelowania pojedynczego portu z komputera lokalnego do zdalnego. Podany przykład to:

```bash
ssh -L 8000:172.16.0.10:80 użytkownik@172.16.0.5 -fN  
```

### Example 2
Tunelowanie zwrotne używa flagi -R, tak jak w przypadku forward, jest ona zazwyczaj używana do tunelowania pojedynczego portu ze zdalnej maszyny z powrotem do naszej lokalnej. Podany przykład to:  

```bash
ssh -R 8000:172.16.0.10:80 kali@172.16.0.20 -i PLIK KLUCZY -fN  
```


### Example 3
Połączenia proxy można również nawiązać za pomocą SSH. Za pomocą flagi -D możemy przesyłać cały ruch lokalny przez dany port przez SSH do zdalnej maszyny. Podany przykład to:  

```bash
ssh -D 1337 użytkownik@172.16.0.5 -fN
```


### Example 4 
Połączony przełącznik -fN robi dwie rzeczy: -f natychmiast ustawia powłokę w tle, dzięki czemu mamy z powrotem nasz własny terminal. -N mówi SSH, że nie musi wykonywać żadnych poleceń - tylko ustanawia połączenie.


### Example 5
Serwery proxy są tworzone za pomocą przełącznika -D, na przykład: -D 1337. Spowoduje to otwarcie portu 1337 na atakującym polu jako serwera proxy do przesyłania danych do chronionej sieci. Jest to przydatne w połączeniu z narzędziem takim jak proxychains. Przykładem tego polecenia byłoby: ssh -D 1337 użytkownik@172.16.0.5 -fN


### Example 6
Po przesłaniu klucza możemy następnie połączyć się z powrotem z portem zwrotnym do przodu za pomocą następującego polecenia: ssh -R LOCAL_PORT:TARGET_IP:TARGET_PORT USERNAME@ATTACK_IP -i KEYFILE -fN
