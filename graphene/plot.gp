set term png
set output "energies.png"

set key outside top horizontal

dt=0.001

set xlabel("Time (ps)")
set ylabel("Potential energy (eV)")
plot "log.lammps" u ($1*dt):3 every 10 t "Total potential energy" lc rgb "black",\
     ""          u ($1*dt):4 every 10 t "Potential energy graphene"lc rgb "red" ,\
     ""	  u ($1*dt):5 every 10 t "Potential energy Water molecules" lc rgb "blue" 


reset
set output "temperature.png"

set xlabel("Time (ps)")
set ylabel("Temperature (K)")

stats 'log.lammps' using 2

plot "log.lammps" u ($1*dt):2 every 10 lc rgb "black"  notitle, STATS_mean lw 2 t "Average value"


set output "total_energies.png"

dt=0.001

set xlabel("Time (ps)")
set ylabel("Potential energy (eV)")

plot "log.lammps" u ($1*dt):3  every 10 lc rgb "black" notitle


set output "potential_graphenes_energies.png"

dt=0.001

set xlabel("Time (ps)")
set ylabel("Potential energy (eV)")
plot [2:] "log.lammps" u ($1*dt):4 every 10 lc rgb "black"  notitle


set output "potential_water_energies.png"

dt=0.001

set xlabel("Time (ps)")
set ylabel("Potential energy (eV)")
plot "log.lammps" u ($1*dt):5 every 10 lc rgb "black" notitle


set print "Energies_results.dat"

stats 'log.lammps' using 3

print "Energy total", " ", STATS_min, " ", STATS_max, " ", STATS_max -STATS_min

stats 'log.lammps' using 4

print "Energy graphene", " ", STATS_min, " ", STATS_max, " ", STATS_max -STATS_min

stats 'log.lammps' using 5

print "Energy water", " ", STATS_min, " ", STATS_max, " ", STATS_max -STATS_min
