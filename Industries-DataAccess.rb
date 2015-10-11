require 'rubygems'
require 'pg'
require 'open-uri'
require './Industries-Math.rb'
require 'csv'
require 'facets'

def SqlExec (str1)
  conn=PGconn.open(:dbname => 'mydb1', :user => 'postgres', :password => 'password')
  conn.exec(str1)
  conn.close
end

def SqlSelect (str1)
  conn=PGconn.open(:dbname => 'mydb1', :user => 'postgres', :password => 'password')
  rs = conn.exec(str1)
  arry1 = rs.to_a
  conn.close
  return arry1
end

# returns array of close prices
def getClosePrices(urlToCSV)
  csv = CSV.parse(open(urlToCSV).read)
  arryCls = Array.new(csv.length-1)
  arryCls=csv.map{ |row| row[4]}
  #  return arryCls[1,arryCls.length-1]
  return arryCls[1,200]
end

def getTransferEntropy(strStock1,strStock2)
url1 = "http://real-chart.finance.yahoo.com/table.csv?s=" + strStock1
url2= "http://real-chart.finance.yahoo.com/table.csv?s=" + strStock2

# array for Stock1
arryS1=getClosePrices(url1)
arryS2=getClosePrices(url2)
arryS1Log=pricesToLog(arryS1)
arryS2Log=pricesToLog(arryS2)

arryJoined=joinArrays(arryS1Log,arryS2Log)

jpdf = arryJoined.frequency.to_a

temp2=arryS1Log.frequency
temp3=arryS2Log.frequency


sum=0
count=0

while count < jpdf.length do

  addMe=(jpdf[count][1]/jpdf.length.to_f) * (1/Math.log(2))*Math.log((jpdf[count][1]/jpdf.length.to_f)/((temp2[jpdf[count][0][0]]/arryS1Log.length.to_f)*(temp3[jpdf[count][0][1]]/arryS2Log.length.to_f)))

  sum=sum+addMe
  count=count+1
end

return sum
end
