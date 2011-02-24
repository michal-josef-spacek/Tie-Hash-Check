# Modules.
use Hash::Check;
use Test::More 'tests' => 3;

print "Testing: nextkey().\n";
tie my %hash, 'Hash::Check', {
	'one' => 1,
	'two' => 2,
};
my $num = 0;
while (my ($key, $val) = each %hash) {
	if ($key eq 'one') {
		is($val, '1');
	} else {
		is($key, 'two');
		is($val, 2);
	}
}
