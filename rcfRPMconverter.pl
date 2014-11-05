#!/usr/bin/env perl
# rcfRPMconverter.pl by Amory Meltzer
# Convert to and from rcf (g-force) and rpm on centrifuges
## Optional option to select from/to
## Built-in defaults for common fuges
## Handle through interactive

use strict;
use warnings;
use diagnostics;

use Getopt::Std;


# Parse commandline options
my %opts = ();
getopts('h', \%opts);
if( $opts{h} ) { usage(); exit; } # Usage















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
