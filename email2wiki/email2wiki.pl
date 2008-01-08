#!/usr/bin/perl
#
# Short program to take email threads and convert them into wiki-compatable downtimes.
#

foreach $downtimeline (<STDIN>) {
	# First, take out the annoying >'s
	$downtimeline =~ s/>//g;
	# Strip out leading spaces but keep wierd paragraph breaks
	if ($downtimeline =~ /^\s+\w/) { $downtimeline =~ s/^\s+//g };
	# Now take out stupid email reply headers
	next if $downtimeline =~ /wrote\:/;
	next if $downtimeline =~ /-0800/;
	next if $downtimeline =~ /<\w+\@/;
	
	if ($downtimeline !=~ /^\s+$/) {
	}
}

print @dtparagraph;
	
