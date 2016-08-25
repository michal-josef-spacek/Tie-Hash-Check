# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Tied construct for hash key checking.';
author 'Michal Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.01;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'Tie-Hash-Check';
readme_from 'Check.pm';
recursive_author_tests('xt');
requires 'Error::Pure' => 0.18;
requires 'Error::Pure::Utils' => 0.18;
requires 'perl' => '5.6.0';
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=Tie-Hash-Check';
resources 'homepage' => 'https://github.com/tupinek/Tie-Hash-Check';
resources 'repository' => 'git://github.com/tupinek/Tie-Hash-Check';
test_requires 'English' => 0;
test_requires 'Hash::Util' => 0;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.04';

# Run.
WriteAll();
