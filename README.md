# URS - projektni zadatak

Ovo je projektni zadatak rađen za predmet Ugradjeni Računarski Sistemi koji se održava na Elektrotehničkom Faklutetu u Banjoj Luci, godine 2019./2020. 
Cilj ovog zadataka je uzimanje podataka o položaju kursora miša i stanja tastera (lijevog i desnog) koji se nalaze na mišu, nakon cega je potrebno ispisati poziciju po x i po y osi, te broj pritisaka lijevog i desnog tastera miša na 7-segmentnim displejima koji se nalaze na DE1 SoC ploči.
Kao dodatak je odrađen i prikaz brzine kretanja misa po X osi na LED-icama.

Za uspjesno izvršenje ovog zadatka potrebno je vladati sa znajem o tome kako funkcionise Linux OS, kako funkcionise AXI magistrala, Qsys i Quartus razvojno okruzenje i VHDL jezik za definisanje hardvera.

U fajlovima koji se nalaze na ovom repozitorijumu moze da se nadje uradjen, gore navedeni, zadatak.

**Bitni fajlovi**

- C program u folderu ***HPS_mouse_read***
- VHDL dio projekta u folderu ***PIO_v2***
  - top level entitet: ***urs_top.vhd***
  - drajver za 7SEG displeje: ***driver_7seg.vhd***
    - pomoćni modul, BCD/7seg konvertor koda: ***bcd_to_7seg.vhd***
  - drajver za LED: ***led_speed_show.vhd***



Radi uspješnog genersianja slike linux OSa zajedno sa VHDL slikom, korištena je PIO (Parallel Input/Output) komponenta. U folderu **urs_pr** se moze vidjeti kako projekat izgleda bez korištenja PIO komponente(napravili smo svoju komponentu sa Avalon interfejsom), ali u tom slucaju generisanje slike je nesto kompleksnije(tačnije, morali bi da modifikujemo *.xml* board info fajlove da bi mogli generisati odgovarajući device tree, a onda napisati i Linux kernel modul - drajver) .

Linux image fajl smo generisali kao u labu 2.