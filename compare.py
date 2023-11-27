import math

def compare(string1, string2): # zwraca int (0, 100) %

    long = []
    short = []
    check = []
    wordsLong = []
    wordsShort = []
    wordsCheck = []

    if len(string1) > len(string2):
        wordsLong = string1.split(' ')
        wordsShort = string2.split(' ')
    else:
        wordsLong = string2.split(' ')
        wordsShort = string1.split(' ')
    for x in wordsLong:
        wordsCheck.append(False)

    theSameWord = 0
    for x in wordsShort:
        for y in range(len(wordsLong)):
            if (wordsLong[y] == x) and (wordsCheck[y] == False):
                wordsCheck[y] = True
                theSameWord += 1
                break

    podobWord = math.ceil(theSameWord/len(wordsLong) * 100)

    return podobWord




