require 'httparty'
require 'multijson'
require 'uri'
require 'cgi'

require 'uptimr/version'

module Uptimr
	attr_accessor :base_url

	def self.config
		yield
	end


end