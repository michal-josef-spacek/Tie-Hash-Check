# Pragmas.
use strict;
use warnings;

# Modules.
use English;
use Hash::Util;
use Tie::Hash::Check;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
tie my %hash, 'Tie::Hash::Check', {
	'one' => 1,
	'two' => 2,
};
my $scalar;
if ($PERL_VERSION lt v5.25.0) {
	$scalar = scalar %hash;
} else {
	$scalar = Hash::Util::bucket_ratio(%hash);
}
like($scalar, qr{\d/8}, 'Get scalar value of hash.');
