#!/usr/bin/perl
#
# Stupid script to inject "line noise" into text.  Injects a random
# symbol from 1-25% of the time per letter of the text file.
#
# Usage ./linenoise.pl < texttolinenoise.txt
#
@linenoise = qw( ! @ # $ % ^ & * \( \) ~ _ - + = \{ \[ \} \] | \ ; : ' " , < . > / ? ~ `);

foreach $line (<STDIN>) {
	@characters = split(//,$line);
	foreach  $indiv (@characters) {
		if (int(rand(100)) < int(rand(25))) {
			print "$linenoise[(int(rand($#linenoise))-1)]";
		}
		print "$indiv";
	 }
}
