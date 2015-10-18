require 'rubygems'
require 'open-uri'
require 'csv'
require './Industries-Math.rb'
require './Industries-DataAccess.rb'

# This program started as win-ruby-Industries4.rb.
# It was found doing the entropy calculations in ruby is
# not suitably fast. Therefore, I decided to just have this
# last ruby written part be a csv downloader. Once the CVS
# are downloaded, I will do the entropy calculations with a c++ program.

#stockSymbolLoop=1953
stockSymbolLoop=1

while stockSymbolLoop <= 21618 do
  #while counter <= 21618 do

  begin
    arry1= SqlSelect('select stock_symbol from stocks where stock_id=' + stockSymbolLoop.to_s)

    strStockSymbol=arry1[0]["stock_symbol"]

    url1="http://real-chart.finance.yahoo.com/table.csv?s=" + strStockSymbol

    csv = CSV.parse(open(url1).read)
  rescue
    stockSymbolLoop=stockSymbolLoop+1
    retry
  end
  arryCls=Array.new(csv.length-1)
  arryCls=csv.map{ |row| row[4] }

  arryS1Log=pricesToLog(arryCls[1,200])

  fileName = strStockSymbol + ".log"

  begin
    #p arryS1Log
    open(fileName, 'w') { |f|
      fileLoop=0
      while fileLoop < arryS1Log.length do
        f.puts arryS1Log[fileLoop]
        fileLoop=fileLoop+1
      end
    }

  rescue
    fileName = "1" + fileName
    retry

  end

  p stockSymbolLoop
  stockSymbolLoop=stockSymbolLoop+1
end
