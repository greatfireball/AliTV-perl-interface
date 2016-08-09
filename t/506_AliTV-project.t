use strict;
use warnings;

use Test::More;
use Test::Exception;

BEGIN { use_ok('AliTV') };

# this test is not required as it always has a file method
can_ok('AliTV', qw(project));

my $obj = new_ok('AliTV');

ok(! defined $obj->project(), 'Default value for project is undef');

my $project_name = 'Project1';
$obj->project($project_name);

is($obj->project(), $project_name, 'project returns the correct project name');

my $project_name2 = 'Project2';
$obj->project($project_name2);

is($obj->project(), $project_name2, 'project returns the correct project name 2');

done_testing;
