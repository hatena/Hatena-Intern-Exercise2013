use strict;
use warnings;

use Data::Dumper;

use Parser;

my $parser = Parser->new( filename => 'log.ltsv' );
warn Dumper $parser->parse;
