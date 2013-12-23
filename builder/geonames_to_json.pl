#!/usr/bin/perl

# Convert the geonames CSV file to a JSON
# object.

my $buf;
my %chash;
my @clist;
my @countries;
my @cities;


open INFILE, "<cities_geonames.csv";
open OUTFILE, ">../cities.js";

while ($buf = <INFILE>)
{
  chomp($buf);
  ($country, $city, $ascii, $pop, $lat, $lon) = split(/;/, $buf);
  push @{$chash{$country}}, [$city, $pop, $lat, $lon];
}

print OUTFILE "var cities = {";

foreach my $country (sort keys %chash)
{
  @clist = @{$chash{$country}};
  @cities = ();
  foreach my $city (@clist)
  {
    push @cities, qq!["$city->[0]", $city->[1], $city->[2], $city->[3]]!;
  }
  push @countries, (qq!"$country":[! . join(",\n", @cities) . "]");
}

print OUTFILE join(",\n", @countries), "\n};\n";

