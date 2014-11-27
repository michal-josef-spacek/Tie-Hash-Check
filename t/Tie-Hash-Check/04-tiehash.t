# Pragmas.
use strict;
use warnings;

# Modules.
use English;
use Error::Pure::Utils qw(clean);
use Tie::Hash::Check;
use Test::More 'tests' => 18;

# Test.
tie my %hash1, 'Tie::Hash::Check', {};
is(ref \%hash1, 'HASH');
is_deeply(
	\%hash1,
	{},
);
my $obj = tied %hash1;
is(ref $obj, 'Tie::Hash::Check');
is_deeply(
	$obj,
	{
		'data' => {},
		'stack' => [],
	}
);

# Test.
tie my %hash2, 'Tie::Hash::Check', {
	'one' => 1,
	'two' => 2,
};
is(ref \%hash2, 'HASH');
is_deeply(
	\%hash2,
	{
		'one' => 1,
		'two' => 2,
	},
);
$obj = tied %hash2;
is(ref $obj, 'Tie::Hash::Check');
is_deeply(
	$obj,
	{
		'data' => {
			'one' => 1,
			'two' => 2,
		},
		'stack' => [],
	},
);

# Test.
tie my %hash3, 'Tie::Hash::Check', {
	'one' => {
		'two' => {
			'three' => 3,
		},
	},
};
is(ref \%hash3, 'HASH');
is_deeply(
	\%hash3,
	{
		'one' => {
			'two' => {
				'three' => 3,
			},
		},
	},
);
$obj = tied %hash3;
is(ref $obj, 'Tie::Hash::Check');
is_deeply(
	$obj,
	{
		'data' => {
			'one' => {
				'two' => {
					'three' => 3,
				},
			},
		},
		'stack' => [],
	},
);
$obj = tied %{$hash3{'one'}};
is(ref $obj, 'Tie::Hash::Check');
is_deeply(
	$obj,
	{
		'data' => {
			'two' => {
				'three' => 3,
			},
		},
		'stack' => ['one'],
	},
);
$obj = tied %{$hash3{'one'}{'two'}};
is(ref $obj, 'Tie::Hash::Check');
is_deeply(
	$obj,
	{
		'data' => {
			'three' => 3,
		},
		'stack' => ['one', 'two'],
	},
);

# Test.
eval {
	tie my %hash1, 'Tie::Hash::Check', 'foo';
};
is($EVAL_ERROR, "Parameter isn't hash.\n", "Parameter isn't hash.");
clean();

# Test.
eval {
	tie my %hash1, 'Tie::Hash::Check', {}, 'foo';
};
is($EVAL_ERROR, "Stack isn't array.\n", "Stack isn't array.");
clean();
