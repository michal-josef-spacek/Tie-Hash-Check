# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'TODO';
author 'Michal Spacek <skim@cpan.org>';
license 'bsd';
name 'Hash-Check';
readme_from 'Check.pm';
requires 'Error::Pure' => 0.01;
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=Hash-Check';
resources 'homepage' => 'https://github.com/tupinek/Hash-Check';
resources 'repository' => 'git://github.com/tupinek/Hash-Check';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.01;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
