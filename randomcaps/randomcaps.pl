#!/usr/bin/perl
#
# Simple script to take a text file and will make the letter capital 
# less than 30% of the time.
#
# Usage ./randomcaps.pl < textfile.txt
# 
#
foreach $line (<STDIN>) {
	@characters = split(//,$line);
	foreach $character (@characters) {
		if (int(rand(100)) < 30) {
			print uc($character);
		} else {
		print "$character";
		}
	}
}
