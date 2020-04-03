package Docker::CLI::Wrapper::Base;

use strict;
use warnings;

use Moo;

sub do_system
{
    my ( $self, $args ) = @_;

    my $cmd = $args->{cmd};
    print "Running [@$cmd]\n";
    if ( system(@$cmd) )
    {
        die "Running [@$cmd] failed!";
    }

    return;
}

1;

__END__

=head1 NAME

Docker::CLI::Wrapper::Base - base class.

=head1 METHODS

=head2 $obj->do_system({ cmd => [@CMD]});

Sugar for system(@CMD) - prints and dies on error.

=cut
