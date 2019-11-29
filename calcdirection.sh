#!/bin/zsh
#最初の二つのアプリは引数をYYYYMMDDHHMMSSで与える
YYYYMMDDHHMMSS=$1 #文字列として時間を入れている
ruby eph_sun_moon.rb $YYYYMMDDHHMMSS > tmpresult$YYYYMMDDHHMMSS.txt
# グリニッジ視恒星時を求めるのにその日の0時の世界時がいる
timeundersix=${YYYYMMDDHHMMSS:8:6}
timefirst=${YYYYMMDDHHMMSS%${timeundersix}}
timezero=${timefirst}000000 #ここで00時の本初子午線のデータにできる
ruby greenwich.rb $timezero >> tmpresult$YYYYMMDDHHMMSS.txt
echo data$YYYYMMDDHHMMSS >> tmpresult$YYYYMMDDHHMMSS.txt


#ここでRubyに引数として渡す
ruby mkarg.rb "$(grep "SUN  R.A." tmpresult$YYYYMMDDHHMMSS.txt)" "$(grep "SUN  DEC." tmpresult$YYYYMMDDHHMMSS.txt)" "$(grep "GAST" tmpresult$YYYYMMDDHHMMSS.txt)"

# 0は時刻 1は赤経 2は赤緯 3はグリニッジ恒星時
SUNRA=$(<tmpsunra.txt)
SUNDEC=$(<tmpsundec.txt)
GAST=$(<tmpgast.txt)
ruby trigonometric.rb $YYYYMMDDHHMMSS $SUNRA $SUNDEC $GAST



echo "done!"
rm tmpresult$YYYYMMDDHHMMSS.txt
rm tmpsunra.txt
rm tmpsundec.txt
rm tmpgast.txt