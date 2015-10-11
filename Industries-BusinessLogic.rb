require 'rubygems'
require './Industries-DataAccess.rb'







=begin

industries table CREATE script

-- Table: industries

-- DROP TABLE industries;

CREATE TABLE industries
(
  industries_id serial NOT NULL,
  industries_name character varying(100),
  industries_url character varying(100),
  sector_id integer,
  CONSTRAINT "industries_id_PK" PRIMARY KEY (industries_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE industries
  OWNER TO "IndustriesDb";



=end












def insertIndustriesData(sector_id,sector_url)
#	puts sector_id + ' ' + 






http = Curl.get(sector_url)
sleep(0.2)
#puts http.body_str

arry1=http.body_str.scan(/<a\nhref=([0-9]+)conameu.html><font\nface=arial\nsize=-1>([^<]+)</).to_a




for element in arry1


	#puts element[0] + 'conameu.html' + ' ' + element[1].gsub(/\n/,' ')

industriesUrl= 'http://biz.yahoo.com/p/' + element[0] + 'conameu.html'

industriesName=element[1].gsub(/\n/,' ')

strSql= 'insert into industries (industries_name,industries_url,sector_id) values ('
strSql=strSql + '\'' + industriesName + '\',\'' + industriesUrl + '\',' + sector_id + ')'
SqlExec(strSql)

sleep(0.2)




end


end














def insertStocksData(industries_id,industries_url)
#	puts sector_id + ' ' + 





http = Curl.get(industries_url)

sleep(0.2)








=begin
href="http://us.rd.yahoo.com/finance/industry/quote/colist/\*http://biz.yahoo.com/([^>]+)>([^<]+)</a> \(<a\nhref="http://us.rd.yahoo.com/finance/industry/quote/colist/\*([^"]+)"
=end




arry1=http.body_str.scan(/href="http:\/\/us.rd.yahoo.com\/finance\/industry\/quote\/colist\/\*http:\/\/biz.yahoo.com\/([^>]+)>([^<]+)<\/a> \(<a\nhref="http:\/\/us.rd.yahoo.com\/finance\/industry\/quote\/colist\/\*([^"]+)"/).to_a

#stockName=arry1[0][1]


=begin
arry1[0][0] =~ /\/([^\/]+)\.html/
stockSymbol=$1
stockName=arry1[0][1].gsub(/\n/,' ')
stockUrl=arry1[0][2]

#puts $1 + " " + arry1[0][1].gsub(/\n/,' ') + " " + arry1[0][2]

strSql= 'insert into Stocks (industry_id,stock_symbol,stock_name,stock_url) values ('
strSql=strSql + industries_id + ',\'' + stockSymbol + '\',\'' + stockName + '\',\'' + stockUrl + '\')'

puts strSql

=end






for element in arry1

element[0] =~ /\/([^\/]+)\.html/

stockSymbol=$1
stockName=element[1].gsub(/\n/,' ')
stockName=stockName.gsub('\'','\'\'')
stockUrl=element[2]

strSql= 'insert into stocks (industry_id,stock_symbol,stock_name,stock_url) values ('
strSql=strSql + industries_id + ',\'' + stockSymbol + '\',\'' + stockName + '\',\'' + stockUrl + '\')'
SqlExec(strSql)

sleep(0.2)




end






end
