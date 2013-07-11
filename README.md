# Hatena Intern Exercise 2013 for CodeIQ

## JavaScript 編

Web サーバーへのアクセスログを表す LTSV 形式の文字列 (詳細は後述します) を引数として受け取り、その文字列をパースしてオブジェクトの配列にして返す関数 `parseLTSVLog` を main.js ファイルに記述してください。
アクセスログを表す LTSV 形式の文字列の例を次に示します。

注意) “&lt;TAB&gt;” は、タブ文字 U+0009 ("\t") を意味します

```
path:/<TAB>reqtime_microsec:200000
path:/bookmark<TAB>reqtime_microsec:123456
```

1 行が 1 つのリクエストに対応しています。
1 行を 1 つの JavaScript のオブジェクトにし、アクセスログ中のラベルと値をプロパティとして持たせるようにしてください。
基本的に、アクセスログ中の値は文字列としてプロパティの値にすれば良いですが、「reqtime_microsec」 というラベルの値についてのみは数値にしてください。

すなわち、

```javascript
var logStr =
    "path:/\treqtime_microsec:200000\n" +
    "path:/help\treqtime_microsec:300000\n" +
    "path:/\treqtime_microsec:250000\n";
```

という形式の文字列を引数として受け取り、

```javascript
[
  { path: "/",     reqtime_microsec: 200000 },
  { path: "/help", reqtime_microsec: 300000 },
  { path: "/",     reqtime_microsec: 250000 },
]
```

という構造の配列を返すように `parseLTSVLog` 関数を実装してください。

上の例では 「path」 というラベルと 「reqtime_microsec」 というラベルのみが存在しますが、任意のラベルを処理できるように実装してください。
「reqtime_microsec」 というラベルの値としては、整数値とみなせる文字列のみが与えられるものとします。

課題で指定されていない仕様は、自由に決めてよいものとします。
例えば、引数が与えられずに関数が呼び出された場合は、例外を送出しても良いですし、空の配列を返すようにしても構いません。

なお、この関数のテストの一部が test.html、test.js に記述されています。
ブラウザで test.html を表示すると、自動的にテストが走るようになっています。
最低限、最初から書かれているテストに通過するように `parseLTSVLog` 関数を実装してください。
テスト用のフレームワークとしては、[QUnit](http://qunitjs.com/) を使用しています。

### この課題における LTSV 形式の文字列について

LTSV (Labeled Tab-separated Values) 形式は、ラベル付けされたデータをタブ区切りの文字列で表現するフォーマットです。
1 行が 1 つのレコードを表します。
Web サーバーのアクセスログなどに主に使用されます。

* 公式サイト: [Labeled Tab-separated Values (LTSV)](http://ltsv.org/)

この課題では JavaScript 上で LTSV 形式の文字列を扱いますが、この課題における LTSV 形式の文字列は次の規則にしたがうものとします。

* ltsv 文字列 = record の 0 回以上の繰り返し
* record = field の 0 回以上の繰り返し + "\n"
* field = label + ":" + field-value
* label = "\n", "\r", "\t", ":" を除く任意の文字の 1 回以上の繰り返し
* field-value = "\n", "\r", "\t" を除く任意の文字の 0 回以上の繰り返し

1 つの record 中には、同じ label をもつ field が 2 回以上出現しないものとします。

注意) この仕様はこの課題独自のものであり、LTSV の公式サイトでの定義とは異なっています。
