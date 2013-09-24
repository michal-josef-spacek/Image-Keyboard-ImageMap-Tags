# Pragmas.
use strict;
use warnings;

# Modules.
use Image::Keyboard::ImageMap::Tags;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Image::Keyboard::ImageMap::Tags::VERSION, 0.01, 'Version.');
