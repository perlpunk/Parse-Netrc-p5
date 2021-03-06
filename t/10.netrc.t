#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 1;

use Parse::Netrc;
local $Data::Dumper::Sortkeys = 1;

use FindBin '$Bin';
my $netrc = Parse::Netrc->read(file => "$Bin/netrc.1");
isa_ok($netrc, "Parse::Netrc");

my $result = $netrc->parse;
warn __PACKAGE__.':'.__LINE__.$".Data::Dumper->Dump([\$result], ['result']);
