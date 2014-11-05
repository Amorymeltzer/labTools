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

if ($opts{r}) {
  my $g = 1.118/100000*$c*$opts{r}*$opts{r};
  print "\n$g\n";
}
elsif ($opts{g}) {
  my $r = sqrt($opts{g}/1.118*100000/$c);
  print "\n$r\n";
}









#### Usage statement ####
# Use POD or whatever?
# Escapes not necessary but ensure pretty colors
# Final line must be unindented?
sub usage
  {
    print <<USAGE;
Usage: $0 [-abfht -d <month[1-12]/day[1-31]>]
      -a Display all times (equivalent to -bf)
      -b Display all past times
      -f Display all upcoming times
      -h Display home times
      -t Display tomorrow\'s times
      -d Specify a date of the form MM/DD
      -c Turn off color printing
      -H print this message
USAGE
  }
