import re
cards = list()
for _ in range(0,int(input())):
    cards.append(input().strip())
for i in cards:
    if not (" -" in i or "- " in i):
        i = ''.join(i.split(' '))
        if (len(i)==16 or len(i)==19) and not (" -" in i or "- " in i):
            if(re.match('^[456][0-9]{3}-*[0-9]{4}-*[0-9]{4}-*[0-9]{4}',i)):
                i = ''.join(i.split('-'))
                if not list(filter(lambda x: x+x+x+x in i,i)):
                    print("Valid")
                else:
                    print("Invalid")
            else:
                print("Invalid")
        else:
            print("Invalid")
    else:
        print("Invalid")