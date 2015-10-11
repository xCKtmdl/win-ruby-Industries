require './Industries-DataAccess.rb'
require './Industries-Math.rb'
require 'facets'

url1 = "http://real-chart.finance.yahoo.com/table.csv?s=adarshpl.bo"
url2= "http://real-chart.finance.yahoo.com/table.csv?s=afpo.l"

# array for Stock1
arryS1=getClosePrices(url1)
arryS2=getClosePrices(url2)
arryS1Log=pricesToLog(arryS1)
arryS2Log=pricesToLog(arryS2)

arryJoined=joinArrays(arryS1Log,arryS2Log)

hashJPDF=arryJoined.frequency

temp2=arryS1Log.frequency
temp3=arryS2Log.frequency

JPDF=hashJPDF.to_a

sum=0
count=0

while count < JPDF.length do

  addMe=(JPDF[count][1]/JPDF.length.to_f) * (1/Math.log(2))*Math.log((JPDF[count][1]/JPDF.length.to_f)/((temp2[JPDF[count][0][0]]/arryS1Log.length.to_f)*(temp3[JPDF[count][0][1]]/arryS2Log.length.to_f)))

  sum=sum+addMe
  count=count+1
end

p sum