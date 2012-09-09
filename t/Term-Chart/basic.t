# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl t/Term-Chart/basic.t'

#########################

use strict;
use warnings;

use Test::More tests => 2;

BEGIN {

    use_ok('Term::Chart')
        || die "failed to use Term::Chart\n";
}

#########################

my $expect = join '',
    "\x{25B8}", "\n",
    "\x{2550}", "\x{25B8}", "\n",
    ("\x{2550}") x 3,  "\x{25B8}", "\n",
    ("\x{2550}") x 5,  "\x{25B8}", "\n",
    ("\x{2550}") x 8,  "\x{25B8}", "\n",
    ("\x{2550}") x 10, "\x{25B8}", "\n",
    ("\x{2550}") x 12, "\x{25B8}", "\n",
    ("\x{2550}") x 15, "\x{25B8}", "\n",
    ("\x{2550}") x 17, "\x{25B8}", "\n",
    ("\x{2550}") x 19, "\x{25B8}", "\n",
    ("\x{2550}") x 22, "\x{25B8}";

my $tc = Term::Chart->new( { default_width => 25 } );

for my $number ( 0 .. 10 ) {

    $tc->add_value( { value => $number } );
}

my $chart = $tc->render();

is( $chart, $expect, 'correct rendering of a basic chart' );

__END__
