# Modules.
use Hash::Check;
use Test::More 'tests' => 1;

tie my %hash, 'Hash::Check', {
	'one' => 1,
	'two' => 2,
};
my ($key) = sort keys %hash;
is($key, 'one');
