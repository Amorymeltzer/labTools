#!/usr/bin/env perl
# rnaToProtein.pl by Amory Meltzer
# Convert RNA sequences to amino acid codes

use strict;
use warnings;
use diagnostics;

unless (@ARGV == 1) {
  print "Usage: $0 <rna sequence>\n";
  exit;
}

my $rna = uc shift @ARGV;

if ($rna !~ /^[AUCG]+$/ix) {
  print "Your RNA sequence can only include the letter A, C, G, and U\n";
  exit;
}

my @sequence;
my $final;
# Split into codons
while ($rna =~ /(\w{3})/g) {
  push @sequence, $1;
  $final = $';
}
if (length($rna) % 3) {
  push @sequence, $final;
}

my %codonMap;
while (<DATA>) {
  chomp;
  s/\ //g;

  my @lookup = split /,/;
  my $result = shift @lookup;
  foreach my $i (0..scalar @lookup - 1) {
    $codonMap{$lookup[$i]} = $result;
  }
}

my $aa;
while (@sequence) {
  my $codon = shift @sequence;
  $aa .= $codonMap{$codon};
}

print "$aa\n";







## The lines below do not represent Perl code, and are not examined by the
## compiler.  Rather, they are the lookup tables for codons to amino acids
__END__
*,UAA,UAG,UGA
  A,GCU,GCC,GCA,GCG
  C,UGU,UGC
  D,GAU,GAC
  E,GAA,GAG
  F,UUU,UUC
  G,GGU,GGC,GGA,GGG
  H,CAU,CAC
  I,AUU,AUC,AUA
  K,AAA,AAG
  L,UUA,UUG,CUU,CUC,CUA,CUG
M,AUG
  N,AAU,AAC
  P,CCU,CCC,CCA,CCG
  Q,CAA,CAG
  R,CGU,CGC,CGA,CGG,AGA,AGG
  S,UCU,UCC,UCA,UCG,AGU,AGC
  T,ACU,ACC,ACA,ACG
  V,GUU,GUC,GUA,GUG
  W,UGG
  Y,UAU,UAC
