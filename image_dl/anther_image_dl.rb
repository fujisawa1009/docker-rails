#ec_force_app_sample/tmp/twitter_image_dl.rb
#twitter_image_dl.rb　https://qiita.com/taroyanaka/items/781b952850d0bebc980f

require 'open-uri'
require 'fileutils'
require 'pp'

name = "test0516_anther_2" #適宜ここをユーザー名に書き換えて使ってくれ/フォルダ名となる！！
#target_url = "https://twitter.com/" + name + "/media"
target_url = "https://yuranoyoshi.com/lol-2"  #ここがDLしたいURLとなる
pp target_url

ary = []
open(target_url) {|f|
  f.each_line {|line| ary << line}
}
#pp ary

#\S	は 空白文字（半角スペース、\t、\n、\r、\f）以外すべて
#正規表現の説明　https://www.megasoft.co.jp/mifes/seiki/meta.html
url = []
#ここがtarget_urlに存在する、実際の画像ファイルのリンクとなる
#match = %r|https://pbs.twimg.com/media/\S*.jpg|
#match = %r|https://waral.club/wp-content/uploads/2022/02/\S*.jpg|
#match = %r|https://waral.club/wp-content/uploads/2022/*/\S*.jpg|
#match = %r|https://waral.club/wp-content/uploads/*/\S*.jpg|
match = %r|https://yuranoyoshi.com/wp-content/*/\S*.jpg|  #DLしたい画像ファイルリンク

cnt = 0
ary.each do |file|
  if file =~ match
    url << file[/https\S*.jpg/]
    puts url
    cnt += 1
  end; nil
end; nil
puts cnt
#後置unlessを除いてフォルダ作成は成功した!!
FileUtils.mkdir("./"+name) unless url == []

url.each do |path|
  @path = path
  fileName = File.basename(@path)
  open("./"+name+"/"+fileName, 'wb') do |output|
    open(@path) do |data|
      output.write(data.read)
    end; nil
  end; nil
end; nil
