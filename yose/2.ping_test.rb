require 'minitest/autorun'
require 'net/http'
require 'json'
require_relative './lib/server'

class PingTest < Minitest::Test

    @@server = nil

    def setup
        if @@server.nil?
            @@server = Server.new 5001
            Thread.new { 
                @@server.start 
            }
        end
        @uri = URI('http://localhost:5001/ping')
    end

    def test_ping_is_available
        response = Net::HTTP.get_response(@uri)

        assert_equal "200", response.code
    end
    def test_answer_is_json
        response = Net::HTTP.get_response(@uri)

        assert_equal "application/json", response['content-type']
    end
    def test_answer_is_alive
        response = Net::HTTP.get_response(@uri)
        answer = JSON.parse(response.body)

        assert_equal true, answer['alive']
    end
    def test_answer_size_is_set
        response = Net::HTTP.get_response(@uri)
        
        assert_equal "14", response['content-length']
    end
    def test_endpoint_can_be_called_twice
        Net::HTTP.get_response(@uri)
        response = Net::HTTP.get_response(@uri)

        assert_equal "200", response.code
    end
end

