# Modules.
use Test::More 'tests' => 2;

BEGIN {
	print "Usage tests.\n";
	use_ok('Hash::Check');
}
require_ok('Hash::Check');
