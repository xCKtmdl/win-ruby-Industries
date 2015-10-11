require 'rubygems'
require 'curb'
require './Industries-DataAccess.rb'
require './Industries-BusinessLogic.rb'





arry1= SqlSelect('select * from sectors')


#insertIndustriesData(arry1[0]["sector_id"],arry1[0]["sector_url"])




for row in arry1
sector_url= row["sector_url"]
sector_id=row["sector_id"]

#puts sector_id + " " + sector_url

insertIndustriesData(sector_id,sector_url)
end






=begin


if File.file? 'output.html'
run 'rm output.html', ''
end



run 'curl ' + firstUrl + '>output.html', ''



if File.file? 'output.html'
	fileString=""
	file = File.open("output.html")
	file.each {|line|
	fileString << line
	}
end


arry1=fileString.scan(/<a\nhref=([0-9]+)conameu.html><font\nface=arial\nsize=-1>([^<]+)</).to_a


puts arry1.length


for element in arry1


	puts element[0] + 'conameu.html' + ' ' + element[1].gsub(/\n/,' ')

	# debugger statement
	#p sqlString


end

=end







