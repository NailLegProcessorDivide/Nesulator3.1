f = open("X:/nestestout.txt", 'r')

output=""
for line in f:
    sp = line.split()
    output+=str(int(sp[1], 16))+","

print(output)
