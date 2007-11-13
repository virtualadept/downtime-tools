#!/usr/bin/perl -n
chomp;
$l=length $_;
next if(!$l);
@a=pack "B$l",$_;
print "@a";
