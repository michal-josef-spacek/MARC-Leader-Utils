use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use MARC::Leader::Utils qw(material_type);
use Test::MockObject;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
eval {
	material_type();
};
is($EVAL_ERROR, "Leader object must be a Data::MARC::Leader instance.\n",
	"Leader object must be a Data::MARC::Leader instance (undef).");
clean();

# Test.
eval {
	material_type('bad');
};
is($EVAL_ERROR, "Leader object must be a Data::MARC::Leader instance.\n",
	"Leader object must be a Data::MARC::Leader instance (string).");
clean();

# Test.
my $mock = Test::MockObject->new;
eval {
	material_type($mock);
};
is($EVAL_ERROR, "Leader object must be a Data::MARC::Leader instance.\n",
	"Leader object must be a Data::MARC::Leader instance (bad object).");
clean();
