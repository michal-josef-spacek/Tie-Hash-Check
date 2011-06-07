# Pragmas.
use strict;
use warnings;

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'AUTHOR' => 'Michal Špaček <skim@cpan.org>',
	'BUILD_REQUIRES' => {
		'File::Object' => 0,
		'Test::More' => 0,
		'Test::Pod' => 0,
		'Test::Pod::Coverage' => 0,
	},
	'CONFIGURE_REQUIRES' => {
		'ExtUtils::MakeMaker' => 0,
	},
	'NAME' => 'Hash::Check',
	'PREREQ_PM' => {
		'Error::Pure' => 0.01,
		'File::Object' => 0,
	},
	'VERSION' => '0.01',
	'test' => {
		'TESTS' => 't/Hash::Check/*.t',
	},
);
