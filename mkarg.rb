
sunrastr = ARGV[0]
sunras = sunrastr.split(" ")
sunra = sunras[3].to_f
file = File.open("tmpsunra.txt","w")
file.puts(sunra)
file.close

sundecstr = ARGV[1]
sundecs = sundecstr.split(" ")
sundec = sundecs[3].to_f
file = File.open("tmpsundec.txt","w")
file.puts(sundec)
file.close

sungaststr = ARGV[2]
sungasts = sungaststr.split(" ")
sungast = sungasts[2].to_f
file = File.open("tmpgast.txt","w")
file.puts(sungast)
file.close