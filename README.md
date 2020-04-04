# URS - projektni zadatak

Ovo je projektni zadatak radjen za predmet Ugradjeni Racunarski Sistemi koji se odrzava na Elektrotehnickom Faklutetu u Banjoj Luci, godine 2019./2020. .
Cilj ovog zadataka je uzimanje podataka o polozaju kursora misa i stanja tastera (lijevog i desnog) koji se nalaze na misu. Nakon cega je potrebno ispisati poziciju po x i po y osi, te broj pritisaka lijevog i desnog tastera misa na sedam segmentnim displejima koji se nalaze na DE1 SoC ploci.
Kao dodatak je odradjen i prikaz brzine kretanja misa po X osi na LED-icama.

Za uspjesno izvrsenje ovog zadatka potrebno je vladati sa zanjem o tome kako funkcionise Linux OS, kako funkcionise AXI magistrala, Qsys i Quartus razvojno okruzenje i VHDL jezik za definisanje hardvera.

U fajlovima koji se nalaze na ovom repozitorijumu moze da se nadje uradjen, gore navedeni, zadatak.
C program se nalazi u folderu HPS_mouse_read, a VHDL dio projekta u folderu PIO_v2.

Radi uspjesnog genersianja slike linux OSa zajedno sa VHDL slikom, koristena je PIO (Parallel Input/Output) komponenta. U folderu urs_pr se moze vidjeti kako projekat izgleda bez koristenja PIO komponente, ali u tom slucaju generisanje slike je nesto kompleksnije.