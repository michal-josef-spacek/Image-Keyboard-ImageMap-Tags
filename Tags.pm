package Image::Keyboard::ImageMap::Tags;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);
use Encode qw(decode_utf8);
use Error::Pure qw(err);
use HTML::Entities qw(encode_entities);

# Version.
our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Process params.
	set_params($self, @params);

	# Object.
	return $self;
}

# Get image map.
sub imagemap {
	my ($self, $keyboard, $usemap) = @_;

	# Check for keyboard.
	if (ref $self->{'keyboard'} ne 'Image::Keyboard') {
		err "Parameter 'keyboard' must be 'Image::Keyboard' object.";
	}

	# Default value for usemap id.
	if (! defined $usemap) {
		$usemap = 'keyboard';
	}

	# Tags.
	my @image_map = (
		['b', 'map'],
		['a', 'name', $usemap],
	);
	foreach my $button_nr ($self->{'keyboard'}->buttons) {
		my $b_hr = $self->{'keyboard'}->config->{'button'}->{$button_nr};
		my $left = $b_hr->{'pos'}->{'left'};
		my $top = $b_hr->{'pos'}->{'top'};
		my $coords = join ',', ($left, $top, $left + $b_hr->{'w'},
			$top + $b_hr->{'h'});
		my $string = $b_hr->{'text'}->{'string'};
		my $enc_string = $self->_encode_js($string);
		push @image_map, (
			['b', 'area'],
			['a', 'id', 'button_'.$button_nr],
			['a', 'shape', 'rect'],
			['a', 'coords', $coords],
			['a', 'onClick', "keyboard_click('$enc_string');"],
			['e', 'area'],
		);
	}
	push @image_map, (
		['e', 'map'],
	);
	return @image_map;
}

# Encode values for js.
sub _encode_js {
	my ($self, $value) = @_;
	if ($value eq decode_utf8('´')) {
		$value = 'Acute_accent';
	} elsif ($value eq decode_utf8('\'')) {
		$value = 'Apostrophe';
	} elsif ($value eq decode_utf8('←')) {
		$value = 'Backspace';
	} elsif ($value eq decode_utf8('˘')) {
		$value = 'Breve';
	} elsif ($value eq decode_utf8('ˇ')) {
		$value = 'Caron';
	} elsif ($value eq decode_utf8('¸')) {
		$value = 'Cedilla';
	} elsif ($value eq decode_utf8('ˆ')) {
		$value = 'Circumflex';
	} elsif ($value eq decode_utf8('¨')) {
		$value = 'Diaeresis';
	} elsif ($value eq decode_utf8('·')) {
		$value = 'Dot';
	} elsif ($value eq decode_utf8('˝')) {
		$value = 'Double_acute_accent';
	} elsif ($value eq decode_utf8('`')) {
		$value = 'Grave_accent';
	} elsif ($value eq decode_utf8('˛')) {
		$value = 'Ogonek';
	} elsif ($value eq decode_utf8('°')) {
		$value = 'Ring';
	} elsif ($value eq '\\') {
		$value = '\\\\';
	}
	my $enc_value = encode_entities($value);
	$value = $enc_value;
	return $value;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Image::Keyboard::ImageMap::Tags - Perl class for image keyboard imagemap in Tags
format creating.

=head1 SYNOPSIS

 use Image::Keyboard::ImageMap::Tags;
 my $obj = Image::Keyboard::ImageMap::Tags->new(%parameters);
 my @imagemap = $obj->imagemap($keyboard, $usemap);

=head1 METHODS

=over 8

=item C<new(%parameters)>

Constructor.

=item C<imagemap($keyboard[, $usemap])>

 Get image map for Image::Keyboard object and usemap id.
 Default value of $usemap id is 'keyboard'.
 Returns array of Tags elements.

=back

=head1 ERRORS

 new():
         From Class::Utils::set_params():
                 Unknown parameter '%s'.

 imagemap():
         Parameter 'keyboard' must be 'Image::Keyboard' object.

=head1 EXAMPLE

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Dumpvalue;
 use Image::Keyboard;
 use Image::Keyboard::ImageMap::Tags;

 # Create example keyboard.
 my $keyboard = Image::Keyboard->new(
         # TODO
 );

 # Image map object.
 my $imagemap = Image::Keyboard::ImageMap::Tags->new;

 # Get imagemap.
 my $tags = $imagemap->imagemap($keyboard);

 # Dump.
 my $dump = Dumpvalue->new;
 $dump->dumpValues($tags); 

 # Output like.
 # TODO

=head1 DEPENDENCIES

L<Class::Utils>,
L<Encode>,
L<Error::Pure>,
L<HTML::Entities>.

=head1 SEE ALSO

L<Image::Keyboard>,
L<Image::Keyboard::Config>,
L<Tags>.

=head1 REPOSITORY

L<https://github.com/tupinek/Image-Keyboard-ImageMap-Tags>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

BSD license.

=head1 VERSION

0.01

=cut
