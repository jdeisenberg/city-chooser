#!/usr/bin/perl

# Take the geonames cities and c
# extract the country code, name, ascii name, population,
# latitude, and longitude

open INFILE, "<cities15000.txt";
open OUTFILE, ">cities_geonames.csv";
while ($data = <INFILE>)
{
  chomp($data);
  ($geoname_id, $name, $asciiname, $alternates, $latitude,
    $longitude, $feature_class, $feature_code, $country_code,
    $cc2, $admin1, $admin2, $admin3, $admin4, $population,
    $evelevation, $dem, $timezone, $mod_date) = split(/\t/, $data);
  if ($population >= 100_000)
  {
    if ($admin1 =~ m/^[A-Z]{2}$/)
    {
      $asciiname .= " ($admin1)";
      $name .= " ($admin1)";
    }
    $asciiname = uc($asciiname);
    print OUTFILE join(";", uc($country_code), $name, $asciiname, $population,
      $latitude, $longitude), "\n";
  }
}
