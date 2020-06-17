f = open("X:/nestestout.txt", 'r')

pcout=""
opcodeout=""
aout=""
xout=""
yout=""
flagsout=""
spout=""

for line in f:
    sp = line.split()
    pcout+=str(int(sp[0], 16))+","
    opcodeout+=str(int(sp[1], 16))+","
    
    lastbit = line[-50:].split()
    aout+=str(int(lastbit[0][-2:], 16))+","
    xout+=str(int(lastbit[1][-2:], 16))+","
    yout+=str(int(lastbit[2][-2:], 16))+","
    print(str(int(lastbit[3][-2:], 16)))
    flagsout+=str(int(lastbit[3][-2:], 16))+","
    spout+=str(int(lastbit[4][-2:], 16))+","

print(pcout)
print(opcodeout)
print(aout)
print(xout)
print(yout)
print(flagsout)
print(spout)
