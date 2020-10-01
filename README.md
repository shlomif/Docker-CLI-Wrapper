# NAME

Docker::CLI::Wrapper - a wrapper for the CLI of docker and compatible tools.

# VERSION

version 0.0.6

# SYNOPSIS

    use Docker::CLI::Wrapper::Container ();

    my $obj = Docker::CLI::Wrapper::Container->new(
        {
            container => "my-docker-container",
            sys => 'debian:sid',
        }
    );
    $obj->clean_up();
    $obj->run_docker();
    $obj->exe_bash_code(
        {
            code => qq#set -e -x; printf "%s\\n" "Hello world!"# ,
        }
    );
    $obj->clean_up();

# DESCRIPTION

These are Perl modules and OOP classes that wrap the docker's (or podman's) Command Line
Interface (CLI).

They were extracted from several programs I wrote that used Docker for
[CI](https://github.com/shlomif/Freenode-programming-channel-FAQ/blob/master/FAQ_with_ToC__generated.md#what-do-continuous-integration-ci-services-such-as-travis-ci-jenkins-or-appveyor-provide)

It is possible that Dockerfiles provide similar functionality, but I was too
lazy to properly learn how to write them.

# SEE ALSO

[Docker::CLI::Wrapper::Container](https://metacpan.org/pod/Docker%3A%3ACLI%3A%3AWrapper%3A%3AContainer) .

# SUPPORT

## Websites

The following websites have more information about this module, and may be of help to you. As always,
in addition to those websites please use your favorite search engine to discover more resources.

- MetaCPAN

    A modern, open-source CPAN search engine, useful to view POD in HTML format.

    [https://metacpan.org/release/Docker-CLI-Wrapper](https://metacpan.org/release/Docker-CLI-Wrapper)

- RT: CPAN's Bug Tracker

    The RT ( Request Tracker ) website is the default bug/issue tracking system for CPAN.

    [https://rt.cpan.org/Public/Dist/Display.html?Name=Docker-CLI-Wrapper](https://rt.cpan.org/Public/Dist/Display.html?Name=Docker-CLI-Wrapper)

- CPANTS

    The CPANTS is a website that analyzes the Kwalitee ( code metrics ) of a distribution.

    [http://cpants.cpanauthors.org/dist/Docker-CLI-Wrapper](http://cpants.cpanauthors.org/dist/Docker-CLI-Wrapper)

- CPAN Testers

    The CPAN Testers is a network of smoke testers who run automated tests on uploaded CPAN distributions.

    [http://www.cpantesters.org/distro/D/Docker-CLI-Wrapper](http://www.cpantesters.org/distro/D/Docker-CLI-Wrapper)

- CPAN Testers Matrix

    The CPAN Testers Matrix is a website that provides a visual overview of the test results for a distribution on various Perls/platforms.

    [http://matrix.cpantesters.org/?dist=Docker-CLI-Wrapper](http://matrix.cpantesters.org/?dist=Docker-CLI-Wrapper)

- CPAN Testers Dependencies

    The CPAN Testers Dependencies is a website that shows a chart of the test results of all dependencies for a distribution.

    [http://deps.cpantesters.org/?module=Docker::CLI::Wrapper](http://deps.cpantesters.org/?module=Docker::CLI::Wrapper)

## Bugs / Feature Requests

Please report any bugs or feature requests by email to `bug-docker-cli-wrapper at rt.cpan.org`, or through
the web interface at [https://rt.cpan.org/Public/Bug/Report.html?Queue=Docker-CLI-Wrapper](https://rt.cpan.org/Public/Bug/Report.html?Queue=Docker-CLI-Wrapper). You will be automatically notified of any
progress on the request by the system.

## Source Code

The code is open to the world, and available for you to hack on. Please feel free to browse it and play
with it, or whatever. If you want to contribute patches, please send me a diff or prod me to pull
from your repository :)

[https://github.com/shlomif/Docker-CLI-Wrapper](https://github.com/shlomif/Docker-CLI-Wrapper)

    git clone https://github.com/shlomif/Docker-CLI-Wrapper.git

# AUTHOR

Shlomi Fish <shlomif@cpan.org>

# BUGS

Please report any bugs or feature requests on the bugtracker website
[https://github.com/shlomif/Docker-CLI-Wrapper/issues](https://github.com/shlomif/Docker-CLI-Wrapper/issues)

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2020 by Shlomi Fish.

This is free software, licensed under:

    The MIT (X11) License
