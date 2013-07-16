use strict;
use warnings;

use Test::More;

use_ok 'Parser';

my $parser = Parser->new( filename => 'log.ltsv' );
isa_ok $parser, 'Parser';

my $parsed = $parser->parse;

isa_ok $parsed->[0], 'Log';
is $parsed->[0]->{'epoch'}, '1372694390';
is $parsed->[0]->{'req'}, 'GET /apache_pb.gif HTTP/1.0';
is $parsed->[0]->{'status'}, '200';
is $parsed->[0]->{'user'}, 'frank';
is $parsed->[0]->{'referer'}, 'http://www.hatena.ne.jp/';
is $parsed->[0]->{'size'}, '2326';
is $parsed->[0]->{'host'}, '127.0.0.1';

isa_ok $parsed->[1], 'Log';
is $parsed->[1]->{'epoch'}, '1372794390';
is $parsed->[1]->{'req'}, 'GET /apache_pb.gif HTTP/1.0';
is $parsed->[1]->{'status'}, '200';
is $parsed->[1]->{'user'}, 'john';
is $parsed->[1]->{'referer'}, 'http://b.hatena.ne.jp/hotentry';
is $parsed->[1]->{'size'}, '1234';
is $parsed->[1]->{'host'}, '127.0.0.1';

isa_ok $parsed->[2], 'Log';
is $parsed->[2]->{'epoch'}, '1372894390';
is $parsed->[2]->{'req'}, 'GET /apache_pb.gif HTTP/1.0';
is $parsed->[2]->{'status'}, '503';
is $parsed->[2]->{'referer'}, 'http://www.example.com/start.html';
is $parsed->[2]->{'size'}, '9999';
is $parsed->[2]->{'host'}, '127.0.0.1';

isa_ok $parsed->[3], 'Log';
is $parsed->[3]->{'epoch'}, '1372694390';
is $parsed->[3]->{'req'}, 'GET /apache_pb.gif HTTP/1.0';
is $parsed->[3]->{'status'}, '500';
is $parsed->[3]->{'user'}, 'frank';
is $parsed->[3]->{'referer'}, 'http://www.hatena.ne.jp/';
is $parsed->[3]->{'size'}, '2326';
is $parsed->[3]->{'host'}, '127.0.0.1';

done_testing();
