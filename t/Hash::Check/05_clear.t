# Modules.
use Hash::Check;
use Test::More 'tests' => 2;

print "Testing: clear().\n";
tie my %hash, 'Hash::Check', {
	'one' => 1,
	'two' => 2,
};
my $keys = keys %hash;
is($keys, 2);
%hash = ();
$keys = keys %hash;
is($keys, 0);
