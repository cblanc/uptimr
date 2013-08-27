require File.expand_path('../test_helper', __FILE__)

Uptimr.config do |config|
	config.base_url = "This is the base URL"
end

puts Uptimr.base_url