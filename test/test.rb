require 'uptimr'
require 'pry'

Uptimr.config do |config|
	config.base_url = "http://status.ideal-postcodes.co.uk"
end

binding.pry