package Docker::CLI::Wrapper;

use strict;
use warnings;

1;

__END__

=head1 NAME

Docker::CLI::Wrapper - a wrapper for the CLI of docker and compatible tools.

=head1 SYNOPSIS

    use Docker::CLI::Wrapper::Container ();

    my $obj = Docker::CLI::Wrapper::Container->new(
        {
            container => "my-docker-container",
            sys => 'debian:sid',
        }
    );
    $obj->clean_up();
    $obj->run_docker();
    $obj->exe_bash_code({code => qq#set -e -x; printf "%s\\n" "Hello world!"});
    $obj->clean_up();

=head1 DESCRIPTION

These are Perl modules and OOP classes that wrap the docker's (or podman's) Command Line
Interface (CLI).

They were extracted from several programs I wrote that used Docker for
L<CI|https://github.com/shlomif/Freenode-programming-channel-FAQ/blob/master/FAQ_with_ToC__generated.md#what-do-continuous-integration-ci-services-such-as-travis-ci-jenkins-or-appveyor-provide>

It is possible that Dockerfiles give similar functionality, but I was too
lazy to learn them.

=head1 SEE ALSO

L<Docker::CLI::Wrapper::Container> .

=cut
