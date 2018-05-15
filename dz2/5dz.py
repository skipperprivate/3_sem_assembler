
string1 = ''
leks_str = ''
type_found = False
print ('input string')
string1 = input()

dz_str = string1.split()

str_length = len(dz_str)


for i in range(3):

    if dz_str[i].lower() == 'const':
        print('slluzhebnoe slovo: ' + dz_str[i])

    if dz_str[i].lower() == 'int' or \
       dz_str[i].lower() == 'float':
        print('slluzhebnoe slovo: ' + dz_str[i])


iden_length = len(dz_str[str_length-1])


print(iden_length)