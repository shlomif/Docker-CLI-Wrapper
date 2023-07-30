package Docker::CLI::Wrapper::Base;

use strict;
use warnings;
use 5.014;
use autodie;

use Moo;
use Path::Tiny qw/ path /;

has 'docker_cmd_line_prefix' =>
    ( is => 'ro', lazy => 1, builder => 'calc_docker_cmd_line_prefix' );

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

sub calc_docker_cmd_line_prefix
{
    my $self = shift;

    {
        my $fh = path("/etc/fedora-release");

        if ( -e $fh )
        {
            if ( my ($fedora_ver) =
                $fh->slurp_utf8() =~ /^Fedora release ([0-9]+)/ )
            {
                if ( $fedora_ver >= 31 )
                {
                    # return ['podman'];
                    return [ 'systemd-run', '--scope', '--user', 'podman' ];
                }
            }
        }
    }
    return ['docker'];
}

sub calc_docker_cmd
{
    my ( $self, $args ) = @_;

    my $cmd = $args->{cmd};
    return { docker_cmd => [ @{ $self->docker_cmd_line_prefix }, @$cmd, ], };
}

sub docker
{
    my ( $self, $args ) = @_;

    my $cmd = $args->{cmd};
    return $self->do_system(
        { %$args, cmd => $self->calc_docker_cmd( $args, )->{'docker_cmd'}, } );
}

1;

__END__

=head1 NAME

Docker::CLI::Wrapper::Base - base class.

=head1 SYNOPSIS

    use Docker::CLI::Wrapper::Base;

    my $obj = Docker::CLI::Wrapper::Base->new();

    $obj->do_system(
        {
            cmd => [
                qw/ls -l/,
            ],
        }
    );

=head1 METHODS

=head2 $obj->do_system({ cmd => [@CMD]});

Sugar for system(@CMD) - prints and dies on error.

=head2 $obj->docker({ cmd => [@CMD]});

Runs docker using the args in @CMD, using do_system.

=head2 $obj->calc_docker_cmd({ cmd => [@CMD]});

Calculates the docker command and returns it (without executing it).

[Added in version 0.0.7.]

=head2 $obj->calc_docker_cmd_line_prefix()

Calculates the prefix for running docker at the attributes' init time.

=cut
