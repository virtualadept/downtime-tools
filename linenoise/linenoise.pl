#!/usr/bin/perl

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
