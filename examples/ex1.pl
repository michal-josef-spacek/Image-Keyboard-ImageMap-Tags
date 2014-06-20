#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use Data::Printer;
use Image::Keyboard;
use Image::Keyboard::ImageMap::Tags;

# Create example keyboard.
my $keyboard = Image::Keyboard->new(
        # TODO
);

# Image map object.
my $imagemap = Image::Keyboard::ImageMap::Tags->new;

# Get imagemap.
my @tags = $imagemap->imagemap($keyboard);

# Dump.
p @tags;

# Output like.
# TODO