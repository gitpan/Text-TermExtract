######################################################################
# Test suite for Text::TermExtract
# by Mike Schilli <cpan@perlmeister.com>
######################################################################

use warnings;
use strict;

use Test::More;
use Text::TermExtract;

plan tests => 6;

my $text = q{ Hey, hey, how's it going? Wanna go to Wendy's 
              tonight? Wendy's has great sandwiches. };

my $ext = Text::TermExtract->new();

my @words = $ext->terms_extract( $text, {max => 3} );

is($words[0], "sandwiches", "keywords");
is($words[1], "tonight", "keywords");
is($words[2], "wendy", "keywords");

$ext->exclude( ['sandwiches'] );
@words = $ext->terms_extract( $text, { max => 3 } );

is($words[0], "tonight", "keywords with exclusions");
is($words[1], "wendy", "keywords with exclusions");
is($words[2], "hey", "keywords with exclusions");

