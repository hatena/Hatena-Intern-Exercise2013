# Hatena Intern Exercise 2013 for CodeIQ
## JavaScript編

Web サーバーへのアクセスログを表す LTSV 形式 (LTSV に関しては Perl の課題中の記述を参照してください) の文字列を引数として受け取り、その文字列をパースしてオブジェクトの配列にして返す関数 `parseLTSVLog` を js/main.js ファイルに記述してください。
アクセスログを表す LTSV 形式の文字列の例を次に示します。

注意) タブがスペースになっています。

```
path:/	reqtime_microsec:200000
path:/bookmark	reqtime_microsec:123456
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

という文字列を引数として受け取り、

```javascript
[
  { path: "/",     reqtime_microsec: 200000 },
  { path: "/help", reqtime_microsec: 300000 },
  { path: "/",     reqtime_microsec: 250000 },
]
```

という構造の配列を返すように `parseLTSVLog` 関数を実装してください。

実際のアクセスログには様々なデータが含まれますが、課題では簡単のため 「path」 というラベルと 「reqtime_microsec」 というラベルのみを考慮すればよいものとします。
「path」 というラベルの値には、URL として有効な文字列が与えられます。
「reqtime_microsec」 というラベルの値としては、整数値とみなせる文字列が与えられます。

課題で指定されていない仕様は、自由に決めてよいものとします。
例えば、引数が与えられずに関数が呼び出された場合は、例外を送出しても良いですし、空の配列を返すようにしても構いません。

なお、この関数のテストは、js/test.html、js/test.js に記述されています。
ブラウザで js/test.html を表示すると、自動的にテストが走るようになっています。
最低限、最初から書かれているテストに通過するように `parseLTSVLog` 関数を実装してください。
余裕があれば、最初から書かれているテストにさらにテストを追加してみてください。
(例えば、予期せぬ値が引数として渡された場合に関するテストなど。)
テスト用のフレームワークとしては、[QUnit](http://qunitjs.com/) を使用しています。
