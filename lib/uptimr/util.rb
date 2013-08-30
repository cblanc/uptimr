module Uptimr
	class Util

		def self.keys_to_sym(raw)			
			case raw
			when Hash
				temp = {}
				raw.each do |key, value|
					key = (key.to_sym rescue key) || key
					temp[key] = keys_to_sym value
				end
				temp
			when Array
				raw.map { |elem| keys_to_sym(elem) }
			else
				raw
			end
		end
		
	end
end