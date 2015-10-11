require 'rubygems'
require 'curb'
require './Industries-DataAccess.rb'
require './Industries-BusinessLogic.rb'





arry1= SqlSelect('select * from industries')

#puts arry1[0]["industries_id"] + " " + arry1[0]["industries_url"]

=begin
industries_url= arry1[0]["industries_url"]
industries_id=arry1[0]["industries_id"]



insertStocksData(industries_id,industries_url)

=end






for row in arry1
industries_url= row["industries_url"]
industries_id=row["industries_id"]

#puts industries_id + " " + industries_url

insertStocksData(industries_id,industries_url)
end










