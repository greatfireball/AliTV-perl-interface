use strict;
use warnings;

use Test::More;
use Test::Exception;

BEGIN { use_ok('AliTV') };

can_ok('AliTV', qw(_calculate_tick_distance ticks_every_num_of_bases));

my $obj = new_ok('AliTV');

my @forbidden_values = (-1, "A", {}, [], 0.5);
foreach my $forbidden_value (@forbidden_values)
{
	throws_ok { $obj->ticks_every_num_of_bases($forbidden_value); } qr/Parameter needs to be an unsigned integer value/, "Exception if parameter is no unsigned integer value (used '$forbidden_value' for test)";
}

$obj = new_ok('AliTV');

ok(! defined $obj->ticks_every_num_of_bases(), 'Default value is undef');

foreach my $value2set (1000, 5000, 100000)
{
   is($obj->ticks_every_num_of_bases($value2set), $value2set, "Value can be set (value was $value2set)");
   is($obj->ticks_every_num_of_bases(), $value2set, "Value can be get afterwards (value was $value2set)");
}

done_testing;