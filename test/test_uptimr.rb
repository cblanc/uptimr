require File.expand_path('../test_helper', __FILE__)


class TestUptimr < Test::Unit::TestCase
	context "Utils" do
		test_data = {
			"ping" => "pong",
			"ping" => ["pong", "pong", "pong"],
			"ping" => {
				"pong" => "pang",
				"pong" => "pang"
			}
		}

		expected_result = {
			ping: "pong",
			ping: ["pong", "pong", "pong"],
			ping: {
				pong: "pang",
				pong: "pang"
			}
		}

		should "convert keys to symbols" do
			result = Uptimr::Util.keys_to_sym test_data
			assert_equal expected_result, result
		end
	end

	context "Invalid request attributes" do
		should "throw an error if invalid http method" do
			assert_raises Uptimr::UptimrError do
				Check.list
			end
		end
	end

	context "API with valid credential" do
		setup do
			Uptimr.config do |config|
				config.base_url = "status.ideal-postcodes.co.uk"
			end
		end	

		teardown do
			Uptimr.config do |config|
				config.base_url = nil
			end	
		end

		should "throw an error if no URL" do
			assert_raises Uptimr:UptimrError do
				Uptimr.request("", {})
			end
		end

	end

end