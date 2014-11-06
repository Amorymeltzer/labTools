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

if (!$opts{r} && !$opts{g}) {
  print "You must specify either rpm (r) or rcf/g (g)\n";
  exit;
} elsif ($opts{r} && $opts{g}) {
  print "You may only specificy either rpm (r) or rcf/g (g)\n";
  exit;
}

# Clean inputs
foreach my $key (keys %opts) {
  checkIfNumber($opts{$key});
}

sub checkIfNumber
  {
    my $check = shift;
    if ($check !~ /^\.\d+$|^\d+\.?\d*$/) {
      print "Input must be a number\n";
      exit;
    }
  }

if (! $opts{c}) {
  print "What is the radius of your centrifuge (cm)?\n";
  $opts{c} = <>;;
}

my $const = 1.118/100000;

if ($opts{r}) {
  my $g =  $const * $opts{c} * $opts{r} * $opts{r};
  printf "%.f\n", $g;
} elsif ($opts{g}) {
  my $r = sqrt($opts{g} / $const / $opts{c});
  printf "%.f\n", $r;
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
