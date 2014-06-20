# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Perl class for image keyboard imagemap in Tags format creating.';
author 'Michal Špaček <skim@cpan.org>';
license 'bsd';
name 'Image-Keyboard-ImageMap-Tags';
readme_from 'Tags.pm';
requires 'Class::Utils' => 0.03;
requires 'Encode' => 0;
requires 'Error::Pure' => 0.11;
requires 'HTML::Entities' => 0;
requires 'perl' => '5.6.2';
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=Image-Keyboard-ImageMap-Tags';
resources 'homepage' => 'https://github.com/tupinek/Image-Keyboard-ImageMap-Tags';
resources 'repository' => 'git://github.com/tupinek/Image-Keyboard-ImageMap-Tags';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.05;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
