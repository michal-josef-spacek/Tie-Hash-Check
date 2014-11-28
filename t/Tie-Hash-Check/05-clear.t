# Pragmas.
use strict;
use warnings;

# Modules.
use Tie::Hash::Check;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
tie my %hash, 'Tie::Hash::Check', {
	'one' => 1,
	'two' => 2,
};
my $keys = keys %hash;
is($keys, 2);
%hash = ();
$keys = keys %hash;
is($keys, 0);
