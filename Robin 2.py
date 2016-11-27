A = int(raw_input("Number of Pedion: "))
B = int(raw_input(("Number of Zattacker: ")))
C = int(raw_input(("Number of Carrier: ")))
S = int(raw_input(("Distance: ")))

import random
F = random.randint (1, 5)
P = random.randint (20, 30)
E = random.randint (50, 100)

EA = 20*S + (F+1)*S/2
EB = 50*S + P*P*S
EC = 30*S + 4*E*S

class my_bot():
    def __init__(self, name, M, random, energy):
        self.name = name
        self.M = M
        self.random = random
        self.energy = energy
    def show(self):
        print self.name, ": "
        print "Weight: ", self.M
        if self.M == 20:
            F = self.random
            print "F: ", self.random
        elif self.M == 50:
            P = self.random
            print "P: ", self.random
        elif self.M == 30:
            E = self.random
            print "E: ", self.random
        print "Energy: ", self.energy

Pedion = my_bot('Pedion', 20, F, EA)
Pedion.show()
print ""
Zattacker = my_bot('Zattacker', 50, P, EB)
Zattacker.show()
print ""
Carrier = my_bot('Carrier', 30, E, EC)
Carrier.show()
print ""

if A*EA > B*EB:
    if A*EA > C*EC:
        print "Pedions comsume most energy: ", A*EA

if B*EB > A*EA:
    if B*EB > C*EC:
        print "Zattackers comsume most energy: ", B*EB

if C*EC > A*EA:
    if C*EC > B*EB:
        print "Carriers comsume most energy: ", C*EC
print ""

total = A*EA + B*EB + C*EC
print "Total energy consumed: ", total

