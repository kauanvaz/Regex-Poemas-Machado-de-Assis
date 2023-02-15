#!/usr/bin/perl

my $file = "./poesias_machado_de_assis.txt";

open(FH, "<", $file) or die $!;
my $lines = do {local $/; <FH>}; # Leitura do arquivo em uma única variável
close(FH);

my @poemas = ($lines =~ /^\A(.*)$|\r\n\r\n.+\r\n\r\n\r\n/gm);
my $numPoemas = @poemas;
print "Número total de poemas: $numPoemas\n";

my @versos = ($lines =~ /.+\r\n(?!\r\n\r\n[^\r])|.+\z/gm);
my $index = 0;
$index++ until $versos[$index] eq "ANTONIO JOSE\r\n";
splice(@versos, $index, 1);
my $numVersos = @versos;
print "Número total de versos: $numVersos\n";

my @estrofes = ($lines =~ /(.+\r\n){2,}/gm);
my $numEstrofes = @estrofes;
print "Número total de estrofes: $numEstrofes\n";

my @sextilhas = ($lines =~ /(?=\r\n\r\n(.+\r\n){6}\r\n)/gm);
my $numSextilhas = @sextilhas;
print "Numero de estrofes sextilha: $numSextilhas\n";

my @sonetos = ($lines =~ /^\r\n\r\n(.+\r\n){4}\r\n(.+\r\n){4}\r\n(.+\r\n){3}\r\n(.+\r\n){3}\r\n\r\n\r\n/gm);
my $numSonetos = @sonetos/4;
print "Número de sonetos: $numSonetos\n";

my $somaVersos = 0;
for my $i(@versos){
    $somaVersos += length($i)
}
my $mediaVersos = $somaVersos/$numVersos;
print "\nTamanho médio dos versos: $mediaVersos\n";

my $mediaEstrofes = $somaVersos/$numEstrofes;
print "Tamanho médio das estrofes: $mediaEstrofes\n";

my $mediaPoemas = $somaVersos/$numPoemas;
print "Tamanho médio dos poemas: $mediaPoemas\n";