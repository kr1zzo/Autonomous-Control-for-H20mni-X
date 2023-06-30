# Usmjeravanje i kontrola pomorskih vozila

## Projekt iz Pomorske robotike

Cilj projekta je izvedba procesa projektiranja navigacije,
algoritmi za navođenje i kontrolu (NGC) za pomorska vozila. Projekt se sastoji se simulacijskog i praktičnog dijela. Ciljano vozilo je H2OmniX - autonomno površinsko vozilo (ASV) koji teži oko 20 kg i lako se postavlja u bazen pračen kamerama i senzorima te je opremljen ROS sustavom. 

### Implementirano je redom:

* Kompenzacija nelinearnosti potisnika osiguravajući zahtijevane sile potisnika 
* Raspodjela kontrole, tj. preslikavanje generaliziranog vektora sila i momenata τ u pojedinačne zahtjeve sile potisnika.
* PI heading controller - regulator smjera potreban za kontrolu kuta H2OmniX-a
• PID positioning controller - regulator za postavljanje H2OmniX-a na željenu lokaciju u bbazen.

### Za demosntraciju rada simulacijskog dijela potrebno je pokrenuti:

1. Učitavanje potrebnik biblioteka
```
MarineRoboticsLib.slx
```
1. Unos željene pozicije (x,y,yaw), maksimalnog nadvišenja i vremena smirivanja te automatski izračun parametara regualtora
```
Regulator.m
```
1. Simulink model - pokretanje pritiskom tipke Run i vizualizacija rezultata pomoću Scope blokova
```
main.slx
```

*Fakultet elektrotehnike i računarstva, lipanj 2023.*