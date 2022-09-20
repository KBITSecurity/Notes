# Keylogger nagrywa wszystkie klawisze nacisniete do nacisniecia enter
# Po naduszeniu enter wyswietli wszystko na ekranie 
# Mozna skozystac z funkcji play ktora drukuje z opuznieniem (tak jak by ktos pisal)

import keyboard
keys = keyboard.record(until = 'ENTER')
#keyboard.play(keys)
print(keys)
