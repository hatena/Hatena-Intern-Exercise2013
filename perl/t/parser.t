use strict;
use warnings;

use Test::More;

use_ok 'Parser';

my $parser = Parser->new( filename => 'log.ltsv' );
isa_ok $parser, 'Parser';

my $parsed = $parser->parse;

isa_ok $parsed->[0], 'Log';
isa_ok $parsed->[1], 'Log';
isa_ok $parsed->[2], 'Log';
isa_ok $parsed->[3], 'Log';

is_deeply $parsed, [
    {
        'epoch' => '1372694390',
        'req' => 'GET /apache_pb.gif HTTP/1.0',
        'status' => '200',
        'user' => 'frank',
        'referer' => 'http://www.hatena.ne.jp/',
        'size' => '2326',
        'host' => '127.0.0.1'
    },
    {
        'epoch' => '1372794390',
        'req' => 'GET /apache_pb.gif HTTP/1.0',
        'status' => '200',
        'user' => 'john',
        'referer' => 'http://b.hatena.ne.jp/hotentry',
        'size' => '1234',
        'host' => '127.0.0.1'
    },
    {
        'epoch' => '1372894390',
        'req' => 'GET /apache_pb.gif HTTP/1.0',
        'status' => '503',
        'referer' => 'http://www.example.com/start.html',
        'size' => '9999',
        'host' => '127.0.0.1'
    },
    {
        'epoch' => '1372694390',
        'req' => 'GET /apache_pb.gif HTTP/1.0',
        'status' => '500',
        'user' => 'frank',
        'referer' => 'http://www.hatena.ne.jp/',
        'size' => '2326',
        'host' => '127.0.0.1'
    },
];

done_testing();
