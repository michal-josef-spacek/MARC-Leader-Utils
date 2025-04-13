package MARC::Leader::Utils;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use List::Util 1.33 qw(any);
use Scalar::Util qw(blessed);
use Readonly;

# Constants.
Readonly::Array our @EXPORT => qw(material_type);

our $VERSION = 0.01;

sub material_type {
	my $leader = shift;

	if (! defined $leader
		|| ! blessed($leader)
		|| ! $leader->isa('Data::MARC::Leader')) {

		err "Leader object must be a Data::MARC::Leader instance.";
	}

	my $material_type;
	if ((any { $leader->type eq $_ } qw(a t))
		&& (any { $leader->bibliographic_level eq $_ } qw(a c d m))) {

		$material_type = 'book';
	} elsif ($leader->type eq 'm') {
		$material_type = 'computer_file';
	} elsif (any { $leader->type eq $_ } qw(e f)) {
		$material_type = 'map';
	} elsif (any { $leader->type eq $_ } qw(c d i j)) {
		$material_type = 'music';
	} elsif ($leader->type eq 'a'
		&& (any { $leader->bibliographic_level eq $_ } qw(b i s))) {

		$material_type = 'continuing_resource';
	} elsif (any { $leader->type eq $_ } qw(g k o r)) {
		$material_type = 'visual_material';
	} elsif ($leader->type eq 'p') {
		$material_type = 'mixed_material';
	} else {
		err "Unsupported 008 type.";
	}

	return $material_type;
}

1;

__END__
