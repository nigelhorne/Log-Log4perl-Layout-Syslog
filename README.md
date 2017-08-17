# Log::Log4perl::Layout::RFC3164

Layout in RFC3164 format

# VERSION

Version 0.01

# SYNOPSIS

This format is useful with the Log::Dispatch::Syslog class.
Add this to your configuration file:

    log4perl.appender.A1=Log::Dispatch::Syslog
    log4perl.appender.A1.Filter=RangeAll
    log4perl.appender.A1.ident=bandsman
    log4perl.appender.A1.layout=Log::Log4perl::Layout::RFC3164

Much of the actual formatting is done by the Sys::Syslog code called
from Log::Dispatch::Syslog,
however you can't use Log::Log4perl::Layout::NoopLayout
since that doesn't insert the ident data that's needed.

## new

    use Log::Log4perl::Layout::RFC3164;
    my $layout = Log::Log4perl::Layout::RFC3164->new();

## render

Render a message in the correct format.

# AUTHOR

Nigel Horne, `<njh at bandsman.co.uk>`

# BUGS

I can't work out how to get the ident given to
Log::Dispatch::Syslog's constructor,
so ident (facility in RFC3164 lingo) is always sent to 
LOG\_USER.

# SEE ALSO

[Log::Log4perl](https://metacpan.org/pod/Log::Log4perl)
[Log::Dispatch::Syslog](https://metacpan.org/pod/Log::Dispatch::Syslog)

# SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Log-Log4perl-Layout-RFC3164

You can also look for information at:

- RT: CPAN's request tracker

    [http://rt.cpan.org/NoAuth/Bugs.html?Dist=Log-Log4perl-Layout-RFC3164](http://rt.cpan.org/NoAuth/Bugs.html?Dist=Log-Log4perl-Layout-RFC3164)

- AnnoCPAN: Annotated CPAN documentation

    [http://annocpan.org/dist/Log-Log4perl-Layout-RFC3164](http://annocpan.org/dist/Log-Log4perl-Layout-RFC3164)

- CPAN Ratings

    [http://cpanratings.perl.org/d/Log-Log4perl-Layout-RFC3164](http://cpanratings.perl.org/d/Log-Log4perl-Layout-RFC3164)

- Search CPAN

    [http://search.cpan.org/dist/Log-Log4perl-Layout-RFC3164/](http://search.cpan.org/dist/Log-Log4perl-Layout-RFC3164/)

# LICENSE AND COPYRIGHT

Copyright 2017 Nigel Horne.

This program is released under the following licence: GPL2
