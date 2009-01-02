# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'AUTHOR' => 'Michal Špaček',
	'NAME' => 'Hash::Check',
	'PREREQ_PM' => {
		'Error::Simple::Multiple' => 0.05,
	},
	'VERSION' => '0.01',
);
