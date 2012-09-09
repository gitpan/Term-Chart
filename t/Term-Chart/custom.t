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
    'X', "\n",
    '=', 'X', "\n",
    ('=') x 3,  'X', "\n",
    ('=') x 5,  'X', "\n",
    ('=') x 8,  'X', "\n",
    ('=') x 10, 'X', "\n",
    ('=') x 12, 'X', "\n",
    ('=') x 15, 'X', "\n",
    ('=') x 17, 'X', "\n",
    ('=') x 19, 'X', "\n",
    ('=') x 22, 'X';

my $tc = Term::Chart->new( { default_width => 25 } );

for my $number ( 0 .. 10 ) {

    my %datum = (
        value     => $number,
        char      => '=',
        last_char => 'X',
    );
    $tc->add_value( \%datum );
}

my $chart = $tc->render();

is( $chart, $expect, 'correct rendering of a custom chart' );

__END__
