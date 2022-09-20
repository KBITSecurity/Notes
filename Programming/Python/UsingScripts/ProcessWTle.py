import subprocess
import os
import sys

ip = "10.10.47.4"

ret1 = subprocess.Popen(["nmap", ip, "-A", "-oN", "jest1"], stdout=subprocess.PIPE)
ret2 = subprocess.Popen(["nmap", ip, "-sV", "-oN", "jest2"], stdout=subprocess.PIPE)
ret3 = subprocess.Popen(["nmap", ip, "-oN", "jest3"], stdout=subprocess.PIPE)

input()  # Proces musi sie skonczyc przed zamknieciem glownego programu (bo zostanie wywalony)


