package Log::Log4perl::Layout::RFC3164;

# See 'https://docs.fluentd.org/v0.12/articles/in_syslog'
use 5.006;
use strict;
use warnings;
# use Log::Log4perl::Level;
# use Net::Address::IP::Local;

no strict qw(refs);
use base qw(Log::Log4perl::Layout);

our %severities = (
	'EMERG' => 0,
	'ALERT' => 1,
	'FATAL' => 2,
	'CRIT' => 2,
	'ERR' => 3,
	'WARN' => 4,
	'NOTICE' => 5,
	'INFO' => 6,
	'DEBUG' => 7,
	'TRACE' => 7,
);

=encoding utf8

=head1 NAME

Log::Log4perl::Layout::RFC3164 - Layout in RFC3164 format

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

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
=cut

=head2 new

    use Log::Log4perl::Layout::RFC3164;
    my $layout = Log::Log4perl::Layout::RFC3164->new();

=cut

sub new {
	my $class = shift;
	$class = ref ($class) || $class;

	return bless {
		# format      => undef,
		info_needed => {},
		stack       => [],
	}, $class;
}

=head2 render

Render a message in the correct format.

=cut

sub render {
	my($self, $message, $category, $priority, $caller_level) = @_;

	# my @months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );

	# my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
	# if($sec < 10) {
		# $sec = "0$sec";
	# }
	# if($min < 10) {
		# $min = "0$min";
	# }
	# if($hour < 10) {
		# $hour = "0$hour";
	# }
# 
	# my $p = $severities{$priority};
	# if(!defined($p)) {
		# warn "Unknown severity $priority";
		# return;
	# }

	# return "<$p>$months[$mon] $mday $min:$hour:$sec " . Net::Address::IP::Local->public_ipv4() . " $p\[$$]: $message";
	# return "$months[$mon] $mday $min:$hour:$sec " . Net::Address::IP::Local->public_ipv4() . " $p\[$$]: $message";
	# return $message;
	return "user: $message";
}

=head1 AUTHOR

Nigel Horne, C<< <njh at bandsman.co.uk> >>

=head1 BUGS

I can't work out how to get the ident given to
Log::Dispatch::Syslog's constructor,
so ident (facility in RFC3164 lingo) is always sent to 
LOG_USER.

=head1 SEE ALSO

L<Log::Log4perl>
L<Log::Dispatch::Syslog>

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Log-Log4perl-Layout-RFC3164

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Log-Log4perl-Layout-RFC3164>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Log-Log4perl-Layout-RFC3164>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Log-Log4perl-Layout-RFC3164>

=item * Search CPAN

L<http://search.cpan.org/dist/Log-Log4perl-Layout-RFC3164/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2017 Nigel Horne.

This program is released under the following licence: GPL2

=cut

1;
