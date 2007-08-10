#!perl

use Test::More tests => 2;

BEGIN {
	use lib "../lib";
	use_ok( 'Date::Holidays::UK::EnglandAndWales' );
}

is(
	Date::Holidays::UK::EnglandAndWales->is_holiday(2005,12,25),
	"Christmas Day",
	'Crimbo 2005'
);