package Term::Chart;

$VERSION = '0.02';

use 5.010000;
use strict;
use warnings;
{
    use Carp;
    use Readonly;
    use Term::ReadKey qw( GetTerminalSize );
}

my ( @STYLES, $CELL, $FG, $BG, $RESET );
{
    Readonly @STYLES => (
        [ "\x{2550}", "\x{25B8}" ],    #  0 ═▸
        [ "\x{2550}", "\x{25B9}" ],    #  1 ═▹
        [ "\x{2550}", "\x{25BA}" ],    #  2 ═►
        [ "\x{2550}", "\x{25BB}" ],    #  3 ═▻
        [ "\x{25FB}", "\x{25B7}" ],    #  4 ◻▷
        [ "\x{25FB}", "\x{25FB}" ],    #  5 ◻◻
        [ "\x{25FC}", "\x{25B6}" ],    #  6 ◼▶
        [ "\x{25FC}", "\x{25D7}" ],    #  7 ◼◗
        [ "\x{25FC}", "\x{25FC}" ],    #  8 ◼◼
        [ "\x{2550}", "\x{25C6}" ],    #  9 ═◆
        [ "\x{2550}", "\x{25C7}" ],    # 10 ═◇
        [ "\x{2550}", "\x{25CF}" ],    # 11 ═●
        [ "\x{2550}", "\x{25CB}" ],    # 12 ═○
    );

    Readonly $CELL  => qq{\x{1B}[38;5;%dm%s\x{1B}[0m};
    Readonly $FG    => qq{\x{1B}[38;5;%dm};
    Readonly $BG    => qq{\x{1B}[48;5;%dm};
    Readonly $RESET => qq{\x{1B}[0m};
}

sub new {
    my ( $class, $param_rh ) = @_;

    $param_rh ||= {};

    my $color_ra      = $param_rh->{color_range};
    my $default_style = $param_rh->{default_style} || 0;
    my $default_width = $param_rh->{default_width} || 0;

    if ( $color_ra && ref $color_ra ne 'ARRAY' ) {

        carp "color_range paramter must be an array ref";
        return;
    }

    if ( $default_style !~ m{\A \d+ \z}xms ) {

        carp 'default_style parameter must be an int';
        return;
    }

    if ( $default_style > $#STYLES ) {

        $default_style = $default_style % $#STYLES;
    }

    my %self = (
        data_ra       => [],
        low_value     => undef,
        high_value    => undef,
        label_size    => undef,
        style_ra      => $STYLES[$default_style],
        color_ra      => $color_ra,
        default_width => $default_width,
    );
    return bless \%self, $class;
}

sub add_value {
    my ( $self, $datum_rh ) = @_;

    $datum_rh ||= {};

    my %datum = (
        label     => "",
        value     => 0,
        color     => 0,
        bg_color  => 0,
        char      => 0,
        last_char => 0,
    );
    for my $key ( keys %datum ) {

        $datum{$key}
            = exists $datum_rh->{$key} && defined $datum_rh->{$key}
            ? delete $datum_rh->{$key}
            : $datum{$key};
    }

    for my $key ( keys %{$datum_rh} ) {

        carp "$key is not a supported value parameter";
    }

    if ( $datum{value} !~ m{\A \d+ \z}xms ) {

        $datum{value} = length $datum{value};
    }

    if (  !defined $self->{label_size}
        || length $datum{label} > $self->{label_size} )
    {
        $self->{label_size} = length $datum{label};
    }

    if ( !defined $self->{high_value}
        || $datum{value} > $self->{high_value} )
    {
        $self->{high_value} = $datum{value};
    }

    if ( !defined $self->{low_value}
        || $datum{value} < $self->{low_value} )
    {
        $self->{low_value} = $datum{value};
    }

    push @{ $self->{data_ra} }, \%datum;

    return scalar @{ $self->{data_ra} };
}

sub render {
    my ($self) = @_;

    my $style_ra      = $self->{style_ra};
    my $high_value    = $self->{high_value};
    my $color_ra      = $self->{color_ra};
    my $default_width = $self->{default_width};
    my $label_size    = $self->{label_size} || 0;

    my $term_width = $default_width || ( GetTerminalSize() )[0] || 80;
    my $max_bar_width = $term_width - $label_size - 2;

    my @lines;

    for my $datum_rh ( @{ $self->{data_ra} } ) {

        my $label     = $datum_rh->{label} || "";
        my $value     = $datum_rh->{value};
        my $color     = $datum_rh->{color};
        my $bg_color  = $datum_rh->{bg_color};
        my $char      = $datum_rh->{char} || $style_ra->[0];
        my $last_char = $datum_rh->{last_char} || $style_ra->[1];

        my @line;

        if ( defined $self->{label_size}
            && $self->{label_size} > 0 )
        {
            my $pad = ' ' x ( $self->{label_size} - length $label );

            $label = "$pad$label: ";    # label plus two

            push @line, $label;
        }

        my $magnitude = ( $value / $high_value ) * $max_bar_width;

        if ( $last_char && $magnitude ) {

            $magnitude--;
        }

        if ($bg_color) {

            push @line, sprintf $BG, $bg_color;
        }

        if ($color) {

            push @line, sprintf $FG, $color;
        }

        for my $i ( 1 .. $magnitude ) {

            if ( !$color && $color_ra ) {

                my $percent = $i / $max_bar_width;

                my $j = int $percent * $#{$color_ra};

                push @line, sprintf $CELL, $color_ra->[$j], $char;
            }
            else {

                push @line, $char;
            }
        }

        if ($last_char) {

            if ( !$color && $color_ra ) {

                my $percent = $magnitude / $max_bar_width;

                $percent = $percent > 0.98 ? 1 : $percent;

                my $j = int $percent * $#{$color_ra};

                push @line, sprintf $CELL, $color_ra->[$j], $last_char;
            }
            else {

                push @line, $last_char;
            }
        }

        if ($color) {

            push @line, $RESET;
        }

        push @lines, join '', @line;
    }

    return join "\n", @lines;
}

sub print {
    my ($self) = @_;

    my $chart = $self->render();

    utf8::encode($chart);

    return print $chart;
}

1;
