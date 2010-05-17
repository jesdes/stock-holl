require 'open-uri'

open("dow.lst"){|file|
	while l = file.gets
		f = l.split(',')
		name = f[1]
		data = Array.new
		
		d = open("http://www.google.com/finance/historical?q=#{name}&startdate=Jan+4%2C+2006&enddate=Apr+21%2C+2009&start=0&num=200&output=csv")
		data.push(d.read)
		sleep(2)

		p "#{name} size:#{data.length}"
		o = open("#{name}.csv","w")
		data.each{|line|
			o.print line.sub("Date,Open,High,Low,Close,Volume\n","").gsub(/^.*,0\n/,"")
		}
		o.close
	end
}
