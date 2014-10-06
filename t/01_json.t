use strict;
use Test::More;
use File::Spec;
use File::Basename 'dirname';
use Plack::Util;
use Test::WWW::Mechanize::PSGI;
use JSON::XS;

my $jsonxs = JSON::XS->new->utf8(1);

my $psgi_file = File::Spec->catfile( dirname(__FILE__), qw/.. app.psgi/ );
my $app = Plack::Util::load_psgi($psgi_file);

my $mech = Test::WWW::Mechanize::PSGI->new(app => $app);
my $json = $jsonxs->encode({name => 'hikarie'});

my $res = $mech->post('/', Content_Type => 'application_json', Content => $json);
ok $res->is_success;

my $res_json = $jsonxs->decode($res->content);
is $res_json->{name}, 'hikarie';

done_testing;
