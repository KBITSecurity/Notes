import turtle

zolwik = turtle.Turtle()

def kwadrat(dlugosc):
    zolwik.left(90)
    zolwik.forward(dlugosc/2)
    zolwik.left(90)
    zolwik.forward(dlugosc)
    zolwik.left(90)
    zolwik.forward(dlugosc)
    zolwik.left(90)
    zolwik.forward(dlugosc)
    zolwik.left(90)
    zolwik.forward(dlugosc/2)

zolwik.speed(100)

zolwik.left(90)
wielkosc = 1

for x in range(30, 301, 30):
    zolwik.color('blue')
    zolwik.pensize(wielkosc)
    wielkosc += 1
    zolwik.right(90)
    zolwik.forward(10)
    kwadrat(x)

turtle.exitonclick()
