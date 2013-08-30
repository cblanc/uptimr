require 'httparty'
require 'multi_json'
require 'uri'
require 'cgi'

require 'uptimr/version'
require 'uptimr/error'
require 'uptimr/util'
require 'uptimr/check'

module Uptimr
	class << self
		attr_accessor :base_url
	end

	def self.config
		yield self
	end

	def self.request(path, options={})
		handle_error "You have not set your API url" if base_url.empty?
		handle_error "Invalid HTTP method" unless %w(get post).include? options[:method].to_s

		options.merge! url: "#{base_url}#{path}"

		puts "About to request: #{options[:url]}"
		response = generate_request(options)

		parse response.body
	end

	def self.parse(raw_json)
		begin
			Util.keys_to_sym MultiJson.load(raw_json)
		rescue MultiJson::DecodeError => e
			handle_error("JSON is buggered")
		end
	end

	def self.handle_error(error)
		raise new Uptimr::UptimrError(error)
	end

	private 

	def self.generate_request(options)
		HTTParty.send options[:method], options[:url], options
	end
end