require 'minitest/autorun'
require 'net/http'
require 'json'
require_relative './lib/Server'

class PingTest < Minitest::Test

    def setup
        @server = Server.new 5001
        @server.start
        @http = Net::HTTP.new 'localhost', 5001
        @http.read_timeout = 3
    end
    def teardown
        @server.stop
    end

    def test_ping_is_available
        response = @http.request_get '/ping'

        assert_equal "200", response.code
    end
    def test_answer_is_json
        response = @http.request_get '/ping'

        assert_equal "application/json", response['content-type']
    end
    def test_answer_is_alive
        response = @http.request_get '/ping'
        answer = JSON.parse(response.body)

        assert_equal true, answer['alive']
    end
end

