require 'bigdecimal'
require 'bigdecimal/util'

#################################
#            引数処理            #
#################################
#ARGV[0] = yyyymmddhhmmss (求めたい時刻が入る e.g 2015年12月22日12時39分45秒なら20151222123945)
#ARGV[1] = arpha(求めたい時刻の視赤経(hour) e.g 17.99649999 )
#ARGV[2] = delta(求めたい時刻の視赤緯(degree) e.g -23.43460770 )
#ARGV[3] = gastdeg (求めたい日の世界標準0時のグリニッジ視恒星時(hour) e.g 1.5748833852842476)

#################################
#            時刻の演算           #
#################################

time = ARGV[0].to_i
ss = time % 100 
ssf = ss.to_f
mm = ((time % 10000) - ss) / 100
mmf = mm.to_f
hh = ((time % 1000000) - (mm + ss)) / 10000
hhf = hh.to_f
hhmmss = (hh * 10000) + (mm * 100) + ss
hhmmssfloat = hhf + (mmf / 60 ) + (ssf / 3600)

#################################
#          経度と緯度の準備        #
#################################
#初期位置は東京駅の座標です

lat = 35.681622.to_f
lath = lat / 15.0
long = 139.767081.to_f
longh = long / 15.0

#################################
#     視赤経と視赤緯の準備         #
#################################
alpha = ARGV[1].to_f
alphadeg = alpha * 15
delta = ARGV[2].to_f
#################################
#            時角の準備           #
#################################
gastdeg = (ARGV[3].to_f * 180.0 /Math::PI).to_f
#p gastdeg.to_s + "<gastdeg"
gasthour = (gastdeg / 15.0).to_f
#p gasthour.to_s + "<gasthour"
hourangle = gasthour + ((hhmmssfloat - 9.0) * 1.0027379.to_f) + (longh - alpha) 
#p hourangle.to_s + "<hourandle"
if hourangle > 24.0 then 
    hourangle = hourangle - 24.0
elsif hourangle < 0.0 then
    hourangle = hourangle + 24.0
else
    hourangle = hourangle 
end

#p hourangle.to_s + "<houranglenew"
hourangledeg = hourangle * 15.0
#p hourangledeg.to_s + "<hourangledeg"

#################################
#          各種三角関数の計算      #
#################################
cosdelta = Math.cos(delta / 180.0 * Math::PI)
sindelta = Math.sin(delta / 180.0 * Math::PI)
coslat = Math.cos(lat / 180.0 * Math::PI)
sinlat = Math.sin(lat / 180.0 * Math::PI)
sinha = Math.sin(hourangledeg / 180.0 * Math::PI)
cosha = Math.cos(hourangledeg / 180.0 * Math::PI)
coshsina = -1.0 * cosdelta * sinha
coshcosa = coslat * sindelta - (sinlat * cosdelta * cosha)
tana = coshsina / coshcosa
atana = Math.atan(tana)
atanadeg = atana * 180.0 / Math::PI

if coshcosa < 0 then
    #puts "(2)<0"
    atanadeggenuine = atanadeg + 180.0
elsif coshsina < 0 && coshcosa > 0 then
    #puts "(1)<0,(2)>0"
    atanadeggenuine = atanadeg + 360.0
else
    atanadeggenuine = atanadeg
end


#################################
#          出力　　　　　　　      #
#################################
p atanadeggenuine
file = File.open("./results/#{time}calcdirection.txt","w")
file.puts(atanadeggenuine)
file.close
