# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Text-Chart.t'

#########################

use strict;
use warnings;

use Test::More tests => 2;

BEGIN {

    use_ok('Term::Chart')
        || die "failed to use Term::Chart\n";
}

my $verbose = grep { $_ eq '-v' } @ARGV;

#########################

my $expect = join '',
    '         label : ',
    "\x{1B}[38;5;195m",
    "\x{25CF}",
    "\x{1B}[0m",
    "\n",
    '        label 1: ',
    "\x{1B}[38;5;195m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;195m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;194m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;194m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;193m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;193m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;193m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;192m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;192m",  "\x{25CF}",
    "\x{1B}[0m",         "\n",
    '       label 22: ', "\x{1B}[38;5;195m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;195m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;194m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;194m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;193m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;193m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;193m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;192m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;192m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;191m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;191m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;190m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;190m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;190m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;189m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;189m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;188m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;188m",  "\x{25CF}",
    "\x{1B}[0m",         "\n",
    '      label 333: ', "\x{1B}[38;5;195m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;195m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;194m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;194m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;193m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;193m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;193m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;192m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;192m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;191m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;191m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;190m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;190m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;190m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;189m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;189m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;188m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;188m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;187m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;187m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;187m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;186m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;186m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;185m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;185m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;185m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;184m",
    "\x{25CF}",          "\x{1B}[0m",
    "\n",                '     label 4444: ',
    "\x{1B}[38;5;195m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;195m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;194m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;194m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;193m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;193m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;193m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;192m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;192m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;191m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;191m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;190m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;190m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;190m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;189m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;189m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;188m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;188m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;187m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;187m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;187m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;186m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;186m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;185m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;185m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;185m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;184m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;184m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;183m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;183m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;182m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;182m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;182m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;181m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;181m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;180m",
    "\x{25CF}",          "\x{1B}[0m",
    "\n",                '    label 55555: ',
    "\x{1B}[38;5;195m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;195m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;194m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;194m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;193m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;193m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;193m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;192m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;192m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;191m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;191m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;190m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;190m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;190m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;189m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;189m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;188m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;188m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;187m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;187m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;187m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;186m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;186m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;185m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;185m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;185m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;184m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;184m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;183m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;183m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;182m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;182m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;182m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;181m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;181m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;180m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;180m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;179m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;179m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;179m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;178m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;178m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;177m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;177m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;177m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;176m",
    "\x{25CF}",          "\x{1B}[0m",
    "\n",                '   label 666666: ',
    "\x{1B}[38;5;195m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;195m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;194m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;194m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;193m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;193m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;193m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;192m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;192m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;191m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;191m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;190m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;190m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;190m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;189m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;189m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;188m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;188m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;187m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;187m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;187m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;186m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;186m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;185m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;185m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;185m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;184m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;184m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;183m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;183m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;182m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;182m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;182m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;181m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;181m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;180m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;180m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;179m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;179m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;179m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;178m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;178m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;177m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;177m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;177m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;176m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;176m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;175m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;175m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;174m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;174m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;174m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;173m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;173m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;173m",  "\x{25CF}",
    "\x{1B}[0m",         "\n",
    '  label 7777777: ', "\x{1B}[38;5;195m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;195m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;194m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;194m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;193m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;193m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;193m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;192m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;192m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;191m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;191m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;190m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;190m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;190m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;189m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;189m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;188m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;188m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;187m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;187m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;187m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;186m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;186m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;185m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;185m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;185m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;184m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;184m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;183m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;183m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;182m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;182m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;182m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;181m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;181m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;180m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;180m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;179m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;179m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;179m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;178m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;178m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;177m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;177m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;177m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;176m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;176m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;175m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;175m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;174m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;174m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;174m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;173m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;173m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;172m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;172m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;171m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;171m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;171m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;170m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;170m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;169m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;169m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;169m",  "\x{25CF}",
    "\x{1B}[0m",         "\n",
    ' label 88888888: ', "\x{1B}[38;5;195m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;195m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;194m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;194m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;193m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;193m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;193m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;192m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;192m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;191m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;191m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;190m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;190m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;190m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;189m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;189m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;188m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;188m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;187m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;187m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;187m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;186m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;186m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;185m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;185m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;185m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;184m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;184m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;183m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;183m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;182m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;182m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;182m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;181m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;181m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;180m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;180m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;179m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;179m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;179m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;178m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;178m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;177m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;177m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;177m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;176m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;176m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;175m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;175m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;174m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;174m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;174m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;173m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;173m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;172m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;172m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;171m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;171m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;171m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;170m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;170m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;169m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;169m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;169m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;168m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;168m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;167m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;167m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;166m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;166m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;166m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;165m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;165m",
    "\x{25CF}",          "\x{1B}[0m",
    "\n",                'label 999999999: ',
    "\x{1B}[38;5;195m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;195m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;194m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;194m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;193m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;193m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;193m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;192m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;192m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;191m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;191m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;190m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;190m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;190m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;189m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;189m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;188m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;188m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;187m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;187m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;187m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;186m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;186m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;185m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;185m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;185m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;184m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;184m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;183m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;183m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;182m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;182m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;182m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;181m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;181m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;180m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;180m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;179m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;179m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;179m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;178m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;178m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;177m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;177m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;177m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;176m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;176m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;175m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;175m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;174m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;174m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;174m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;173m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;173m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;172m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;172m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;171m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;171m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;171m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;170m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;170m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;169m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;169m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;169m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;168m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;168m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;167m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;167m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;166m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;166m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;166m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;165m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;165m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;164m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;164m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;163m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;163m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;163m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;162m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;162m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;161m",  "\x{2550}",
    "\x{1B}[0m",         "\x{1B}[38;5;161m",
    "\x{2550}",          "\x{1B}[0m",
    "\x{1B}[38;5;160m",  "\x{25CF}",
    "\x{1B}[0m";

my $tc = Term::Chart->new(
    {   default_style => 11,
        color_range   => [ reverse 160 .. 195 ],
        default_width => 100,
    }
);

for my $number ( 0 .. 9 ) {

    my %datum = (
        value => $number,
        label => ( 'label ' . $number x $number ),
    );
    $tc->add_value( \%datum );
}

my $chart = $tc->render();

is( $chart, $expect, 'correct rendering of a elaborate chart' );

if ( $verbose ) {

    utf8::encode( $chart );
    print "$chart\n";
}

__END__
