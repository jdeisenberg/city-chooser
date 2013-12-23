#!/usr/bin/perl
#

my $buf;
my $name;
my $three;
my $two;
my %convert = ();
my $replace;

open INFILE, "<three_to_two.txt";

while ($buf = <INFILE>)
{
  chomp($buf);
  ($three, $name, $two) = split(/;/, $buf);
  $convert{$three} = $two;
}
close(INFILE);

while ($buf = <STDIN>)
{
  foreach my $item (sort keys %convert)
  {
    $replace = $convert{$item};
    $buf =~ s/$item/$replace/g;
  }
  print $buf;
}

