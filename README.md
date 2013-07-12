# Hatena Intern Exercise 2013 for CodeIQ
## Perl編

LTSV (Labeled Tab-separated Values) とはラベル付きのTSVフォーマットです。
LTSVの1レコードは、`label:value` という形式で表されたラベル付きの値がタブ文字区切りで並びます。

以下に LTSV の例を示します。

* ltsv.log

```
host:127.0.0.1	user:frank	epoch:1372694390	req:GET /apache_pb.gif HTTP/1.0	status:200	size:2326	referer:http://www.hatena.ne.jp/
host:127.0.0.1	user:john	epoch:1372794390	req:GET /apache_pb.gif HTTP/1.0	status:200	size:1234	referer:http://b.hatena.ne.jp/hotentry
host:127.0.0.1	user:-	epoch:1372894390	req:GET /apache_pb.gif HTTP/1.0	status:302	size:9999	referer:http://www.example.com/start.html
```

例えば、1レコード目の host の値は 127.0.0.1 であり、2レコード目の referer の値は http://b.hatena.ne.jp/hotentry になります。LTSV についてより詳しくは、以下を参照して下さい。

* http://blog.stanaka.org/entry/2013/02/05/214833
* http://ltsv.org/

### 課題

上記の LTSV の1レコードを表す Log クラスを実装して下さい。
(Perl のオブジェクト指向については [Hatena-Textbook](https://github.com/hatena/Hatena-Textbook/blob/master/oop-for-perl.md) などを参考にして下さい。)

Log クラスは以下のメソッドを持ちます。
* `req` の値に含まれている HTTP メソッド名を返す `method` メソッド
* `req` の値に含まれているリクエストパスを返す `path` メソッド
* `req` の値に含まれているプロトコル名を返す `protocol` メソッド
* `host` と `req` の値からリクエストされた uri を組み立てて返す `uri` メソッド
* `epoch` が表している日付を `YYYY-MM-DDThh:mm:ss` というフォーマットの文字列に変換して返す `time` メソッド
    * 日付を扱うモジュールを用いてかまいません
    * タイムゾーンは GMT として下さい


* main.pl

```perl
use strict;
use warnings;

use Log;

my $log = Log->new(
    host    => '127.0.0.1',
    user    => 'frank',
    epoch   => '1372694390',
    req     => 'GET /apache_pb.gif HTTP/1.0',
    status  => '200',
    size    => '2326',
    referer => 'http://www.hatena.ne.jp/',
);
print $log->method . "\n";
print $log->path . "\n";
print $log->protocol . "\n";
print $log->uri . "\n";
print $log->time . "\n";
```

```shell
$ perl -Ilib main.pl
```

* 出力

```perl
$ perl -Ilib main.pl
GET
/apache_pb.gif
HTTP/1.0
http://127.0.0.1/apache_pb.gif
2013-07-01T15:59:50
```

また、このリポジトリの `/t` 以下に含まれているテストを実行して、課題が正しく動作していることを確認してください。

* Perl のテストの実行に関しては、[Hatena-Textbook](https://github.com/hatena/Hatena-Textbook/blob/master/oop-for-perl.md#-58) を参照して下さい。
