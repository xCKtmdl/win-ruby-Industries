require './Industries-DataAccess.rb'
require './Industries-Math.rb'
require 'facets'


mainStock="adarshpl.bo"
#transferEntropy = getTransferEntropy("adarshpl.bo","afpo.l")



counter=2

while counter <= 21618 do
#while counter <= 21618 do

arry1= SqlSelect('select stock_symbol from stocks where stock_id=' + counter.to_s)

p arry1[0]["stock_symbol"].to_s

p getTransferEntropy(mainStock,arry1[0]["stock_symbol"].to_s)

p counter
counter=counter+1
end 


