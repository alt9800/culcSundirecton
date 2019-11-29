require 'csv'

#######
#csvファイル読み込んで行単位で配列に格納
#######


s = []
File.foreach("./na20-data.txt"){|line|
  s << line.chomp.encode("UTF-8", "Shift_JIS")
}



#######
#行ごとにテキストファイルの空白を使って要素にしていく
#######

int = s.count

num = 0
ss = []
until num == int do
    ss << s[num].split(" ")
    num = num + 1
end 


#######
#変数a,bを用意する 指定した位置にあるのか年によって違ったりするので注意
#######

sunab = ss[6].map!(&:to_s) # 2019,2020は配列の6番目の要素から取って来る
sunabfast = sunab[1].split(/[=|,]/).grep(/[0-9]/).map!(&:to_i) #>["a=0", "b=121"] -> ["a", "0", "b", "121"]
sunabmiddle = sunab[4].split(/[=|,]/).grep(/[0-9]/).map!(&:to_i) 
sunablate = sunab[6].split(/[=|,]/).grep(/[0-9]/).map!(&:to_i)

#######
#二次元配列を転置してRAとDECを作る
#ここも9..21なのも、元のテキストのフォーマットによって変わることもある
#######

sss = []
for i in 9..21
    sss << ss[i]
end


sssrafast = sss.transpose[1] 
sssramiddle = sss.transpose[4]
sssralate = sss.transpose[7]
sssdecfast = sss.transpose[2]
sssdecmiddle = sss.transpose[5]
sssdeclate = sss.transpose[8]

#配列の要素としてconst.rbに入れられる形にする。
absssrafast = [2020] << sunabfast  << sssrafast
absssramiddle = [2020] << sunabmiddle << sssramiddle
absssralate = [2020] << sunablate << sssralate
absssdecfast = [2020] << sunabfast  << sssdecfast
absssdecmiddle = [2020] << sunabmiddle  << sssdecmiddle
absssdeclate = [2020] << sunablate << sssdeclate

#浮動小数点(float)の表示が指数表示になってしまうのを防ぐため最後までStringとして扱いコマンドラインに結果を返す
puts "SUN_RA = [\n" + "    #{absssrafast}\n".gsub!("\"","")+ "    #{absssramiddle}\n".gsub!("\"","")+ "    #{absssralate}\n".gsub!("\"","") + "]"
puts "SUN_DEC = [\n" + "    #{absssdecfast}\n".gsub!("\"","")+ "    #{absssdecmiddle}\n".gsub!("\"","")+ "    #{absssdeclate}\n".gsub!("\"","") + "]"

#decのa,bもraと共通