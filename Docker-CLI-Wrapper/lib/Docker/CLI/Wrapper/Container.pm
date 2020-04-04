package Docker::CLI::Wrapper::Container;

use strict;
use warnings;
use 5.014;
use autodie;

use Moo;

extends('Docker::CLI::Wrapper::Base');

has 'container' => ( is => 'ro', required => 1, );
has 'sys'       => ( is => 'ro', required => 1, );

sub clean_up
{
    my ($self) = @_;

    eval { $self->docker( { cmd => [ 'stop', $self->container(), ] } ); };

    eval { $self->docker( { cmd => [ 'rm', $self->container(), ] } ); };

    return;
}

sub run_docker
{
    my ($self) = @_;

    $self->docker( { cmd => [ 'pull', $self->sys() ] } );
    $self->docker(
        {
            cmd => [
                'run',              "-t",
                "-d",               "--name",
                $self->container(), $self->sys(),
            ]
        }
    );

    return;
}

1;

__END__

=head1 NAME

Docker::CLI::Wrapper::Container - manage a container.

=head1 SYNOPSIS

    use Docker::CLI::Wrapper::Container ();

    my $obj = Docker::CLI::Wrapper::Container->new(
        {
            container => "my-docker-container",
            sys => 'debian:sid',
        }
    );

=head1 METHODS

=head2 $obj->sys()

The desired operating system / docker image to use for the container.
A string.

=head2 $obj->container()

The container name / ID.

A string.

=head2 $obj->run_docker()

Get the container to run (after pulling its system).

[Added in version 0.0.3.]

=head2 $obj->clean_up()

Stops and deletes the container.

=head2 $obj->do_system({ cmd => [@CMD]});

Sugar for system(@CMD) - prints and dies on error.

=head2 $obj->docker({ cmd => [@CMD]});

Runs docker using the args in @CMD, using do_system.

=head2 $obj->calc_docker_cmd_line_prefix()

Calculates the prefix for running docker at the attributes' init time.

=cut
