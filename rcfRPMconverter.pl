#!/usr/bin/env perl
# rcfRPMconverter.pl by Amory Meltzer
# Convert to and from rcf (g-force) and rpm on centrifuges
## Optional option to select from/to
## Built-in defaults for common fuges
## Handle through interactive

# g = (1.118 x 10^-5) x R x S^2
# g = g
# R = radius, cm
# S = rpm


use strict;
use warnings;
use diagnostics;

use Getopt::Std;


# Parse commandline options
my %opts = ();
getopts('r:g:c:h', \%opts);

if ($opts{h}) {
  usage(); exit;
}

if ($opts{r} && $opts{g}) {
  print "You may only specificy either rpm (r) or rcf/g (g)\n";
  exit;
}

my $c;
if ($opts{c}) {
  $c = $opts{c};
}
else {
  print "What is the radius of your centrifuge (cm)?\n";
  $c = <>;
}

my $const = 1.118/100000;

if ($opts{r}) {
  my $g =  $const * $c * $opts{r} * $opts{r};
  printf "\n%.f\n", $g;
}
elsif ($opts{g}) {
  my $r = sqrt($opts{g} / $const / $c);
  printf "\n%.f\n", $r;
}









#### Usage statement ####
# Use POD or whatever?
# Escapes not necessary but ensure pretty colors
# Final line must be unindented?
sub usage
  {
    print <<USAGE;
Usage: $0 [-rgch]
      -r specify a speed in rpm, cannot be used with -g option
      -g specify rcf (g), cannot be used with -f option
      -c specify the rotor radius, in centimeters (cm)
      -h print this message
USAGE
  }
