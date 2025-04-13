package MARC::Leader::Utils;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
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

	# TODO
}

1;

__END__
