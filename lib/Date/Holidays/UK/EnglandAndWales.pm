package Date::Holidays::UK::EnglandAndWales;
use strict;
use warnings;
use base qw(Exporter);
our $VERSION = '0.01';
our @EXPORT = qw( is_uk_holiday );

=head1 NAME

Date::Holidays::UK::EnglandAndWales - Public Holidays in England and Wales

=head1 SYNOPSIS

  use Date::Holidays::UK::EnglandAndWales;
  my ($year, $month, $day) = (localtime)[ 5, 4, 3 ];
  $year  += 1900;
  $month += 1;
  warn "Holiday" if is_uk_holiday( $year, $month, $day );
  warn "Holiday" if Date::Holidays::UK::EnglandAndWales->is_holiday( $year, $month, $day );

=head1 DESCRIPTION

These bank and public holidays are holidays in England and Wales,
and not necessarily for Scotland and Northern Ireland.

=head2 MODULE HISTORY

This module is based on L<Date::Holidays::UK|Date::Holidays::UK>
by Richard Clamp, Amelie Guyot, Jerome Parfant, which did not contain
the dates needed by my clients.

As Msrs Clamp et al note in the L<POD for their module|Date::Holidays::UK/DESCRIPTION>,
Naming modules is a tricky thing: I've named this C<EnglandAndWales> because
the C<UK> module cannot include holidays for Northern Ireland and Scotland,
and maintain its API.

=head2 USE

	is_uk_holiday( $year, $month, $day )

	Date::Holidays::UK::EnglandAndWales->is_uk_holiday( $year, $month, $day )

May be called as class method or subroutine.
Returns the name of the Holiday that falls on the given day, or undef
if there is none.

Year must be four-digit. Strips any leading zeros from month and day.

Can be included or imported to a class as an object method, since the first
argument supplied is discarded if an reference.

=head2 EXPORTS

C<is_uk_holiday> is exported by default, but this is deprecated and will
be removed in a future version.

=cut

# XXX either programatically fill these, or just do the monkey work
# OOK!
our %holidays;

$holidays{ 2004,  1,  1 } =
$holidays{ 2005,  1,  3 } =
$holidays{ 2006,  1,  2 } =
$holidays{ 2007,  1,  1 } =
$holidays{ 2008,  1,  1 } =
$holidays{ 2009,  1,  1 } =
$holidays{ 2010,  1,  1 } = "New Year's Day";

$holidays{ 2004,  4,  9 } =
$holidays{ 2005,  3, 25 } =
$holidays{ 2006,  4, 14 } =
$holidays{ 2007,  4,  6 } =
$holidays{ 2008,  3, 21 } =
$holidays{ 2009,  4, 10 } =
$holidays{ 2010,  4,  2 } = "Good Friday";

$holidays{ 2004,  4, 12 } =
$holidays{ 2005,  3, 28 } =
$holidays{ 2006,  4, 17 } =
$holidays{ 2007,  4,  9 } =
$holidays{ 2008,  3, 24 } =
$holidays{ 2009,  4, 13 } =
$holidays{ 2010,  4,  5 } = "Easter Monday";

$holidays{ 2004,  5,  3 } =
$holidays{ 2005,  5,  2 } =
$holidays{ 2006,  5,  1 } =
$holidays{ 2007,  5,  7 } =
$holidays{ 2008,  5,  5 } =
$holidays{ 2009,  5,  4 } =
$holidays{ 2010,  5,  3 } = "Early May Bank Holiday";

$holidays{ 2004,  5, 31 } =
$holidays{ 2005,  5, 30 } =
$holidays{ 2006,  5, 29 } =
$holidays{ 2007,  5, 28 } =
$holidays{ 2008,  5, 26 } =
$holidays{ 2009,  5, 25 } =
$holidays{ 2010,  5, 31 } = "Spring Bank Holiday";

$holidays{ 2004,  8, 30 } =
$holidays{ 2005,  8, 29 } =
$holidays{ 2006,  8, 28 } =
$holidays{ 2007,  8, 27 } =
$holidays{ 2008,  8, 25 } =
$holidays{ 2009,  8, 31 } =
$holidays{ 2010,  8, 30 } = "Summer Bank Holiday";

$holidays{ $_, 12, 25 } = "Christmas Day" for 2004..2020;
$holidays{ $_, 12, 26 } = "Boxing Day" for 2004..2020;

$holidays{ 2004, 12, 27 } = "Substitute Bank Holiday in lieu of 26 Dec";

$holidays{ 2004, 12, 28 } =
$holidays{ 2005, 12, 27 } = "Substitute Bank Holiday in lieu of 25 Dec";

$holidays{ 2010, 12, 27 } = "Substitute Bank Holiday in lieu of 25 Dec";
$holidays{ 2010, 12, 28 } = "Substitute Bank Holiday in lieu of 26 Dec";

sub is_uk_holiday {
    warn "IN";
    shift if $_[0] eq __PACKAGE__ or ref $_[0];
    my ($year, $month, $day) = @_;
    $month =~ s/^0//;
    $day   =~ s/^0//;
    warn "$year $month $day";
    return exists $holidays{ $year, $month, $day }?
    	$holidays{ $year, $month, $day }
    :	undef;
}

# alias
*is_holiday = *is_uk_holiday;


1;

__END__

=head1 Holiday Data

The DTI's webpage L<http://www.dti.gov.uk/employment/bank-public-holidays/index.html|http://www.dti.gov.uk/employment/bank-public-holidays/index.html>
is taken as the canonical source for bank holidays.

=head1 CAVEATS

We only currently contain the DTI bank holiday detail, which at the
time of writing only covers the years 2004-2010.

These bank and public holidays are holidays in England and Wales,
and not necessarily for Scotland and Northern Ireland.

=head1 AUTHOR

Lee Goddard.

Simply an update of work by Richard Clamp <richardc@fotango.com>, Amelie Guyot, Jerome Parfant.

=head1 COPYRIGHT

Copyright 2004 Fotango.  All Rights Reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 BUGS

None known.

Bugs should be reported to me via the CPAN RT system.
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Date::Holidays::UK::EnglandAndWales>.

=head1 SEE ALSO

L<Date::Holidays::UK>

=cut

