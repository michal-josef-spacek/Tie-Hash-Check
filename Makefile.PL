# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'TODO';
author 'Michal Špaček <skim@cpan.org>';
license 'bsd';
name 'Hash-Check';
requires 'Error::Pure' => 0.01;
resources 'repository' => {
	'url' => 'git://github.com/tupinek/Hash-Check',
	'web' => 'https://github.com/tupinek/Hash-Check',
	'type' => 'git',
};
test_requires 'English' => 0;
test_requires 'File::Object' => 0.01;
test_requires 'Test::More' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
