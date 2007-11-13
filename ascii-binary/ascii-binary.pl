#!/usr/bin/perl -n
$l=(length $_)*8;
@a=unpack "B$l",$_;
print "@a\n";
