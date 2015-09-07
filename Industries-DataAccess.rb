require 'rubygems'
require 'pg'

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
