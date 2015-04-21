require 'json'
require 'net/http'
require 'open-uri'
require 'appscript'  # use`gem install rb-appscript` to install appscript

http_url = "http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=zh-cn"

begin
	pic_hash = JSON.parse(Net::HTTP.get(URI(http_url)))
	url = pic_hash["images"][0]["url"]
	name = url.split('/').last
	pic_file = "/tmp/#{name}" 
	File.open pic_file, 'wb' do |client|
		open url, 'rb' do | remote|
			client.write remote.read
			Appscript.app("System Events").desktops.picture.set pic_file
		end
	end
rescue Exception => e
	puts "#{e}"
end
