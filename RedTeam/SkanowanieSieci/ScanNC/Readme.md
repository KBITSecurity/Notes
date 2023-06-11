

Pingowanie portow:
```bash
for i in {1..255}; do (ping -c 1 172.16.0.${i} | grep "bytes from" &); done
```

Skanowanie hostow:
```bash
for i in {1..65535}; do (echo > /dev/tcp/192.168.1.1/$i) >/dev/null 2>&1 && echo $i is open; done
```

Next example:
```bash
for i in $(seq 1 11); do nc -v -n -z -w 1 10.0.2.$i 445; done
```

