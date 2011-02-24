# Modules.
use Hash::Check;
use Test::More 'tests' => 1;

print "Testing: scalar().\n";
tie my %hash, 'Hash::Check', {
	'one' => 1,
	'two' => 2,
};
my $scalar = scalar %hash;
is($scalar, '2/8');
