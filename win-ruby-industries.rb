require 'rubygems'
require 'curb'
require './Industries-DataAccess.rb'

baseURL="http://biz.yahoo.com/p/"
http = Curl.get(baseURL)
#puts http.body_str

arry1=http.body_str.scan(/href=([1-9])conameu.html><font\nface=arial\nsize=-1>([a-zA-Z\s]+)</).to_a

# For some reason I didn't have to
# filter out these weird line returns in the linux version
for element in arry1
  if (!(element[1] !~ /\n/))
    element[1][/\n/]=' '
  end
end

for element in arry1
  sqlString='insert into sectors values (' + element[0] + ',\'' + element[1] + '\',\'' + baseURL + element[0] + 'conameu.html\')'
  SqlExec(sqlString)
  #p sqlString
end