require 'test/unit'
require 'mocha/setup'
require 'uptimr'
require 'shoulda'

module UpTimr
	attr_accessor :mock

	def self.mock=(mock)
		@mock = mock
	end

	def self.generate_request(options)
		@mock.execute options[:method], options
	end
end

def test_response(body, status=200)
	body = MultiJson.dump(body)
	m = mock
	m.instance_variable_set('@instance_vals', { code: status, body: body})
	def m.body; @instance_vals[:body]; end
	def m.code; @instance_vals[:code]; end
	m
end

def checks
	File.read(File.expand_path('../test_data/checks.json', __FILE__))
end

def check
	File.read(File.expand_path('../test_data/check.json', __FILE__))
end

def pings
	
end

def events
	
end