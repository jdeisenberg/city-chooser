#!/usr/bin/perl

# Just for my information, what is the longest
# city name?

$max = 0;

while ($buf = <STDIN>)
{
  ($name, $x) = split(/;/, $buf);
  $name =~ s/\(.*\)$//;
  if (length($name) > $max)
  {
    $max = length($name);
    $max_name = $name;
  }
  if ($name !~ m/[a-z]/)
  {
    print "All caps: $name\n";
  }
}

print "Longest name is $max_name ($max)\n";
