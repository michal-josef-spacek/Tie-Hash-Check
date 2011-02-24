# Modules.
use Hash::Check;
use Test::More 'tests' => 16;

print "Testing: tiehash().\n";
tie my %hash1, 'Hash::Check', {};
is(ref \%hash1, 'HASH');
is_deeply(
	\%hash1,
	{},
);
my $obj = tied %hash1;
is(ref $obj, 'Hash::Check');
is_deeply(
	$obj,
	{
		'data' => {},
		'stack' => [],
	}
);

tie my %hash2, 'Hash::Check', {
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
is(ref $obj, 'Hash::Check');
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

tie my %hash3, 'Hash::Check', {
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
is(ref $obj, 'Hash::Check');
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
is(ref $obj, 'Hash::Check');
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
is(ref $obj, 'Hash::Check');
is_deeply(
	$obj,
	{
		'data' => {
			'three' => 3,
		},
		'stack' => ['one', 'two'],
	},
);
