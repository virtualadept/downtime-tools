#!/usr/bin/perl
#
# for usleep
use Time::HiRes qw(usleep);

# Disable terminal buffering
$| = 1;

# Catch term signals that will dump to a shell, turns these off for debugging
$SIG{'INT'} = 'IGNORE';
$SIG{'TERM'} = 'IGNORE';
$SIG{'ALRM'} = 'IGNORE';

$randomdelay = int(rand(50000)) + 30000; # Baseline delay
$randomsaved; # Saves our alter delays

foreach $text (<>) {
        @typing = split(//,$text);
        foreach $letter (@typing) {
                if ($letter eq '`') { $randomdelay += (int(rand(10000)) + 5000); next; } # Slower!
                if ($letter eq '~') { $randomdelay -= (int(rand(10000)) + 5000); next; } # Faster!
                if ($letter eq '^') { $randomdelay = (int(rand(50000)) + 30000); next;} # Default!
                if ($letter eq '#') { sleep(int(rand(5))+1); next; } # Random Second Pauses
                $randomsaved = $randomdelay; 
                
		# This adds small random +/- changes to each letter to emulate typing
		$randsign = int(rand(2)); 
		if ($randsign == "1") { $randomdelay += int(rand(30000)) }
		else { $randomdelay -= int(rand(30000)) }
                
		print $letter;
                if ($randomdelay < 0) { $randomdelay = 0; } # usleep bombs with negative microseconds
		usleep($randomdelay);
                $randomdelay = $randomsaved; # restore saved delay
        }
}

