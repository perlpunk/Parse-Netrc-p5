use strict;
use warnings;
package Parse::Netrc;

use Pegex::Parser;
use Parse::Netrc::Grammar;
use Parse::Netrc::Tree;

use Mo;
has tree => ();
has data => ();

use constant DEBUG => $ENV{NETRC_DEBUG} ? 1 : 0;

sub read {
    my ($class, %args) = @_;
    my $file = $args{file};
    open my $fh, "<", $file or die $!;
    my $data = do { local $/; <$fh> };
    close $fh;
    my $netrc = $class->new(
        data => $data,
    );
    return $netrc;
}

sub parse {
    my ($self) = @_;

    my $parser = Pegex::Parser->new(
        grammar => Parse::Netrc::Grammar->new,
        receiver => Parse::Netrc::Tree->new,
        debug => DEBUG,
    );

    my $result = $parser->parse($self->data);
    $self->tree($result);
    return $result;
}

1;
