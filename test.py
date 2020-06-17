name = input("file: ")
if name == "":
    name = "X:/nestestout.txt"
f = open(name, 'r')
i, j = input("column (i,j): ").split(",")
output=""
for line in f:
    sp = line.split(" ")
    output+=str(int(sp[i].split(":")[j], 16))+","

print(output)
