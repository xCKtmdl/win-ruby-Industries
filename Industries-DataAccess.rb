require 'rubygems'
require 'pg'
require 'open-uri'
require 'csv'

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

