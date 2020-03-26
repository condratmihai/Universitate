_BTinfo = [1, 5, 4, -1, -1, -1, -1, 9, 8, 3, -1, 0, 0, 0, 0, -1, -1, -1, 2]
_RSDcitit = [1, 5, 3, -1, -1, -1, 4, 9, -1, 2, -1, -1, 8, -1, -1]

BTinfo = []
RSD = []

RSD = _RSDcitit

def GenerateRSD(value):
    RSD.append(value)
    if (value == -1):
        return
    GenerateRSD (BTinfo[2*value-1])
    GenerateRSD (BTinfo[2*value])

#GenerateRSD (BTinfo[0])
#print(RSD)

buffer = []

noIter = 0;

def PrintBT(value):

    if (value == -1):
        print ('N')
    else:
        print (value)

    if (value != -1):
        buffer.append(BTinfo[2*value-1])
        buffer.append(BTinfo[2*value])

    if (buffer != []):
        temp = buffer[0]
        buffer.pop(0)
        PrintBT(temp)

BTinfo = [0] * (2 * max(RSD) + 1)
BTinfo[0] = 1

def GenerateBTinfo(next, prev, lastNatural, check_right):
    read = RSD[next]
    next = next + 1

    temp = lastNatural
    if (read != -1):
        lastNatural = read

    if (read != -1):
        if (check_right == 1):
            BTinfo[2 * prev] = read
            check_right = 0
        else:
            BTinfo[2 * prev - 1] = read
        prev = read

    if (read == -1):

        if (check_right == 1):
            BTinfo[2 * prev] = read
        else:
            BTinfo[2 * prev - 1] = read

        check_right = 1
        if (prev == -1):
            prev = lastNatural

        if (BTinfo[2 * prev] != 0 and BTinfo[2 * prev - 1] != 0):
            x = lastNatural
            while 1:
                parent = (BTinfo.index(x) + 1) // 2
                if BTinfo[2 * parent] == 0:
                    lastNatural = parent
                    break
                else:
                    x = parent

        prev = lastNatural

    if (next < len(RSD)):
        GenerateBTinfo(next, prev, lastNatural, check_right)

GenerateBTinfo(1, 1, 1, 0)

statement = 'Parcurgere in preordine (RSD): '

for number in BTinfo:
    if number == 0:
        statement += '';
    elif number == -1:
        statement += 'N '
    else:
        statement += str(number) + ' '
        #statement += ' '

statement += '\nArborele generat este următorul:\n'

print (statement)

PrintBT(1)
