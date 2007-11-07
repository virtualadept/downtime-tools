#!/usr/bin/perl

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
