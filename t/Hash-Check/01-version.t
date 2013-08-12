# Pragmas.
use strict;
use warnings;

# Modules.
use Hash::Check;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Hash::Check::VERSION, 0.01, 'Version.');
