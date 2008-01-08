#!/usr/bin/perl
#
# Short program to take email threads and convert them into wiki-compatable downtimes.
# This is really really rough.

use Text::Wrap;

foreach $downtimeline (<STDIN>) {
	# First, take out the annoying >'s
	$downtimeline =~ s/>//g;
	# Strip out leading spaces but keep wierd paragraph breaks
	if ($downtimeline =~ /^\s+\S/) { $downtimeline =~ s/^\s+//g };
	# Now take out stupid email reply headers
	$downtimeline = "-----------" if $downtimeline =~ /wrote\:/;
	next if $downtimeline =~ /-0800/;
	next if $downtimeline =~ /<\w+\@/;

	#Feed lines of text into an array until we hit a paragraph
	push(@dtparagraph, $downtimeline);	
	
	# We hit a paragraph break, lets do a bunch of stuff to the array
	if ($downtimeline =~ /^(\s|\n)+$/) {
		chomp(@dtparagraph);
		print wrap('','',@dtparagraph) . "\n\n";	
		@dtparagraph = undef;
	}
}

	
