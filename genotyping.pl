#!/usr/bin/env perl
# genotyping.pl by Amory Meltzer
# Calculate needed amounts for a very specific genotyping protocol

use strict;
use warnings;
use diagnostics;

my $samples;
if (!@ARGV) {
  print "How many samples+controls are you running?\n";
  $samples = <>;
} elsif (@ARGV != 1) {
  print "Usage: $0 <number_of_samples+controls>\n";
  exit;
} else {
  $samples = $ARGV[0];
}
if ($samples !~ m/^\d+$/) {
  print "Number of samples+controls must be a whole number\n";
  exit;
}

chomp $samples;
print "$samples reactions; ";
$samples *= 1.1;
print "prepare enough for $samples\n\n";

my @keys = qw(MM F R H2O);
my %amounts = (
	       MM => 10,
	       F => 2,
	       R => 2,
	       H2O => 5.5
	      );
my @protocols = qw(Mod 20 25);
print "\t";
print join "\t", @protocols;
print "\n";

foreach (@keys) {
  my $vingt = $samples*$amounts{$_};
  my $tofiv = $vingt*1.25;
  print "$_\t";
  print "$amounts{$_}\t$vingt\t$tofiv\n";
}

print "\nLMHP:\n98 => 5m\n98 => 10s --";
print "\n68 => 10s   | > 35 cycles\n72 => 30s --\n72 => 1m\n4 => inf\n";
