#!perl -w

use strict;
use warnings;

use Test::DescribeMe qw(author);
use Test::Most;
use Test::Needs 'Test::GreaterVersion';

Test::GreaterVersion::has_greater_version_than_cpan('Log::Log4perl::Layout::Syslog');

done_testing();
