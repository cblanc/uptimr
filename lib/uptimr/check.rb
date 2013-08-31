require 'time'

module Uptimr
	class Check
		attr_accessor :id, :is_up, :last_tested, :name, :responsiveness, 
								:response_time, :availability, :url, :count,
								:daily_stats, :hourly_stats, :monthly_stats, :first_tested

		def initialize(params)
			@id = params[:_id]
			@is_up = params[:isUp]
			@first_tested = Time.iso8601(params[:firstTested]).localtime
			@last_tested = Time.iso8601(params[:lastTested]).localtime
			@name = params[:name]
			@url = params[:url]
			@responsiveness = params[:qos][:responsiveness].to_f
			@response_time = params[:qos][:responseTime].to_f
			@availability = params[:qos][:availability].to_f
			@count = params[:qos][:count]
		end

		def self.list
			response = Uptimr.request "/api/checks", method: :get
			response.map { |check| self.new check }
		end

		def self.find(id)
			self.new Uptimr.request "/api/checks/#{id}", method: :get
		end

		def get_hourly_stats(from=0, to=Time.now)
			@hourly_stats ||= Uptimr.request "/api/checks/#{@id}/stats/hour?begin=#{to_ms from}&end=#{to_ms to}", method: :get
		end

		def get_daily_stats(from=0, to=Time.now)
			@daily_stats ||= Uptimr.request "/api/checks/#{@id}/stats/day?begin=#{to_ms from}&end=#{to_ms to}", method: :get
		end

		def get_monthly_stats(from=0, to=Time.now)
			@monthly_stats ||= Uptimr.request "/api/checks/#{@id}/stats/month?begin=#{to_ms from}&end=#{to_ms to}", method: :get
		end

		def reload_stats
			get_hourly_stats if @hourly_stats.nil?
			get_daily_stats if @daily_stats.nil?
			get_monthly_stats if @monthly_stats.nil?
		end
		
		private

		def to_ms(time)
			time.to_i * 1000
		end
	end
end