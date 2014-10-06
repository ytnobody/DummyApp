use strict;
use JSON::XS;
use Plack::Request;

my $jsonxs = JSON::XS->new->utf8(1);

sub {
    my $env = shift;

    my $req = Plack::Request->new($env);

    my $json_str = $req->content;
    my $json = $jsonxs->decode($json_str);

    my $name = $json->{name} || 'unko';
    my $data = $jsonxs->encode({
        name => $name,
        type => 'vegetable',
    });

    [200, ['Content-Type' => 'application/json'], [$data]];
}
