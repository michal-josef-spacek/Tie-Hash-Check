# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Tie::Hash::Check;
use Test::More 'tests' => 4;

# Test.
tie my %hash, 'Tie::Hash::Check', {
	'one' => 1,
	'two' => 2,
};
my $keys = keys %hash;
ok($hash{'one'});
ok($hash{'two'});
delete $hash{'one'};
eval {
	my $val = $hash{'one'};
};
is($EVAL_ERROR, "Key 'one' doesn't exist.\n");
delete $hash{'two'};
eval {
	my $val = $hash{'two'};
};
is($EVAL_ERROR, "Key 'two' doesn't exist.\n");
