require 'rubygems'

# returns array of joint probability
def joinArrays(arryS1Log,arryS2Log)

  retArry = Array.new(arryS1Log)

  counter=0

  while counter < arryS1Log.length do
    #p arry1[counter].to_f
    retArry[counter]=[arryS1Log[counter],arryS2Log[counter]]
    counter=counter+1
  end

  return retArry
end

# returns array of close prices
def pricesToLog(arry1)

  retArry = Array.new(arry1.length-1)

  counter=0

  while counter < arry1.length-1 do
    #p arry1[counter].to_f
    retArry[counter]=Math.log(arry1[counter].to_f/arry1[counter+1].to_f).round(2)
    counter=counter+1
  end

  return retArry
end
