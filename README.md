# culcSundirecton *日本国内向け太陽方向の計算ツール*

**暫定的に、サブモジュールの中身のうち必要なものをカレントリポジトリにコピーして置いています**

このリポジトリは日本国内における太陽方位の計算を行うツールです。

Ruby、およびbashを用いて計算を行います。



[国立天文台が公開している方位角の計算方法](https://eco.mtk.nao.ac.jp/koyomi/topics/html/topics2005.html)より式を作成しています。

視赤径(緯)、グリニッジ視恒星時は[mk-mode氏の計算結果](https://github.com/komasaru)を用いています。

この場を借りてお礼申し上げます。


参照元のユーザに敬意を表し、自由に使ってください。
Ruby2.6が入るunix系のOSで動きます。(winは今のところサポートしていません。シェルスクリプトをbat形式で書き直すと動くようにしています。)




## 使い方

 1. このリポジトリをclone or DLする
 2. 起動前に`gem install mk_greenwich`をしておく
 3. `sh calcSundirection.sh YYYYMMDDHHMMSS` を入力 (例:2019年11月12日14時24分30秒の太陽角度を計算したいなら引数は -> '20191112142430' とする)
 4. コンソールの標準出力、およびResultsディレクトリに結果がテキストで出力されます。
 
[動作イメージ]
![動作イメージ](https://github.com/alt9800/culcSundirecton/blob/master/動作イメージ.jpg "hoge")

## その他

秒単位まで求めると小数点以下2位くらいレベルの誤差が出るようです。

./eph_sun_moon/eph_sun_moon.rb で用いる const.rb に含まれている定数表は2019年までのものとなっています。

[海上保安庁](https://www1.kaiho.mlit.go.jp/KOHO/) よりテキスト形式で毎年次年度分まで計算結果が公表されています。

さらに、この定数をネストした配列形式でコンソールに出力するプログラム(convTxtArr.rb)も付けていますのでよかったら利用してください。
当ファイル内の./hogehoge.txtをダウンロードしてきた定数表のパス名に変えて実行するとコンソールにconst.rbに追記できるような形でネストされた配列が出力されます。


例年次年度分の計算結果まで上記サイトで公開されていますので、必要に応じてダウンロードし、スクリプトに修正を加えてください。
あるいは、不定期に元のコードもメンテナンスされてますので、MK-modeのさんの対応の方がこちらより早いかもしれません。

## 関連リンク

親ディレクトリのプログラムの作者の解説
- (太陽や他の恒星の)視赤径/視赤緯
https://www.mk-mode.com/blog/2016/05/12/ruby-calc-ecliptic-ephemeris-by-kaiho/#
- グリニッジ視恒星時などについて
https://www.mk-mode.com/blog/2018/08/05/ruby-gmst-with-iau-1982/#


ブラウザで太陽の方位や視赤径(緯)、グリニッジ視恒星時(時角)を計算できるサイトもあります。
検算や比較を行ってみてください。
https://eco.mtk.nao.ac.jp/cgi-bin/koyomi/cande/horizontal.cgi
https://keisan.casio.jp/exec/system/1185781259
http://park12.wakwak.com/~maki/lst.htm


## todo

- grapeでAPI化する
- 暦の反映2021-2022

