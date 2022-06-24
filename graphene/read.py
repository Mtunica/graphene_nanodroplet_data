import numpy as np

energy1=[]
energy2=[]
energy3=[]

with open("log.lammps") as filein:
    for line in filein:
        if "#" in line:
            continue

        else:
            line=line.split()

            energy1.append(float(line[2]))
            energy2.append(float(line[3]))
            energy3.append(float(line[4]))


joules=1.60217663

print(len(energy1))

average1= np.average(energy1[5000::])
std1=np.std(energy1[5000::])
average2= np.average(energy2[5000::])
std2= np.std(energy2[5000::])
average3= np.average(energy3[7000::])
std3= np.std(energy3[7000::])


area=92
minimum=np.average(energy2[2:5])
minimum_dst=np.std(energy2[2:5])
print(average1-energy1[1], std1)
print((average2-minimum), np.sqrt(std2*std2+minimum_dst*minimum_dst), (average2-minimum)*joules/area,np.sqrt(std2*std2+minimum_dst*minimum_dst)*joules/area )
print(average3-energy3[1], std3)
