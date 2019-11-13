# culcSundirecton
*日本国内向け太陽方向の計算ツール*

このリポジトリは日本国内における太陽方向の計算を行うツールです


MITライセンスにしていますが参照元のユーザに合わせているので実質ライセンスは存在しません。自由に使ってください。
Ruby2.6が入るunix系のOSならだいたい動くんじゃないでしょうか。


## 使い方

 1. このリポジトリをclone or DLする
 2. 起動前に`gem install mk_greenwich`をしておく
 3. `sh hogehoge.sh YYYYMMDDHHMMSS` を入力 (例:2019年11月12日14時24分30秒の太陽角度を計算したいなら -> '20191112142430' とする)

## その他

calc/fugafuga で用いるhogeに含まれている定数表は2019年までのものとなっています。
https://から取得しています。

この定数をネストした配列形式にコンソールに出力するプログラムも付けていますのでよかったら利用されてください。


例年次年度分の計算結果まで上記サイトで公開されていますので、必要に応じてダウンロードしてください。
不定期に元のコードもメンテナンスされてますので、Mk-modeのさんの対応の方がこちらより早いかもしれません。

