#!perl -Tw


# See https://www.snip2code.com/Snippet/1423169/Regex-for-SYSLOG-format-RFC3164-and-RFC5424
#	fixed to include pririty and version

use strict;
use warnings;
use Test::Most tests => 4;
use Test::NoWarnings;
use Sys::Syslog qw(:standard :macros);

BEGIN {
	use_ok('Log::Log4perl::Layout::RFC3164');
}

RFC3164: {
	my $layout = new_ok('Log::Log4perl::Layout::RFC3164');

	if($ENV{'TEST_VERBOSE'}) {
		diag($layout->render("'su root' failed for lonvick on /dev/pts/8", LOG_SECURITY, LOG_CRIT, 0));
	}
	my $regex = qr/<\d{1,3}>.*[A-Z][a-z][a-z]\s{1,2}\d{1,2}\s\d{2}[:]\d{2}[:]\d{2}\s[\w][\w\d\.@-]*\s.*$/;
	like($layout->render("'su root' failed for lonvick on /dev/pts/8", LOG_SECURITY, LOG_CRIT, 0), $regex, 'check valid rfc3124');
}
