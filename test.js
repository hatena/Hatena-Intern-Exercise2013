"use strict";

QUnit.module("課題");

QUnit.test("関数定義の確認", function () {
    QUnit.ok(typeof parseLTSVLog === "function", "`parseLTSVLog` という名前の関数がある");
});

QUnit.test("`parseLTSVLog` 関数の動作確認", function () {
    var logStr;
    var logRecords;

    logStr = "path:/\treqtime_microsec:500000\n";
    logRecords = parseLTSVLog(logStr);
    QUnit.deepEqual(logRecords, [
        { path: "/", reqtime_microsec: 500000 }
    ], "1 行のみのログデータが期待通りパースされる");

    logStr =
        "path:/\treqtime_microsec:400000\n" +
        "path:/uname\treqtime_microsec:123456\n" +
        "path:/\treqtime_microsec:500000\n";
    logRecords = parseLTSVLog(logStr);
    QUnit.deepEqual(logRecords, [
        { path: "/",      reqtime_microsec: 400000 },
        { path: "/uname", reqtime_microsec: 123456 },
        { path: "/",      reqtime_microsec: 500000 }
    ], "3 行からなるログデータが期待通りパースされる");

    logStr = "";
    logRecords = parseLTSVLog(logStr);
    QUnit.deepEqual(logRecords, [], "空文字列を渡したときは空の配列を返す");

    // テストを追加する場合は、この下に追加しても構いませんし、
    // `QUnit.test` 関数や `QUnit.asyncTest` 関数を用いて別に定義しても良いです。

});

