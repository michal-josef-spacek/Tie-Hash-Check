use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('Tie::Hash::Check');
}

# Test.
require_ok('Tie::Hash::Check');
