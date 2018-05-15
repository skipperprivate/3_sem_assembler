
string1 = ''
leks_str = ''
initialized = False

print ('input string')
string1 = input()

dz_str = string1.split()

str_length = len(dz_str)


for i in range(str_length):

    if dz_str[i].lower() == 'const':
        print('slluzhebnoe slovo: ' + dz_str[i])
        leks_str += 'const'

    if dz_str[i].lower() == 'int' or \
       dz_str[i].lower() == 'float':
        print('slluzhebnoe slovo: ' + dz_str[i])
        leks_str += 'type'



iden_length = len(dz_str[str_length-1])
pos = str_length-1
gr1 = dz_str[pos].find('[')
id1 = ''

for k in range(gr1):
    id1 += dz_str[pos][k]

print('identify = ' + id1)
leks_str += 'V_'
number = 0



for j in range(gr1,iden_length):

    if dz_str[pos][j] == '[' or \
       dz_str[pos][j] == ']' or \
       dz_str[pos][j] == '{' or \
       dz_str[pos][j] == '}' or \
       dz_str[pos][j] == ';' or \
       dz_str[pos][j] == ',':
            print('sluzhebniy symbol: ' + dz_str[pos][j])
            leks_str += dz_str[pos][j]

    if dz_str[pos][j] == '=':
        print('sluzhebniy symbol: ' + dz_str[pos][j])
        leks_str += dz_str[pos][j]
        initialized = True

    if dz_str[pos][j].isdigit():
            number = number *10 + int(dz_str[pos][j])
            if not dz_str[pos][j+1].isdigit() and dz_str[pos][j+1] == ']':
                leks_str += 'size'
                print('size: ' + str(number))
                number = 0
            else:
                leks_str += 'val'
                print('value: ' + str(number))
                number = 0


print('')
print(leks_str)
print('')

if initialized:
    print('initialized')
else:
    print('not initialized')