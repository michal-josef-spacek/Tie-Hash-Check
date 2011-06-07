# Pragmas.
use strict;
use warnings;

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'AUTHOR' => 'Michal Špaček <skim@cpan.org>',
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
