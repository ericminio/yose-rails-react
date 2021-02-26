require 'minitest/autorun'

class TddReadyTest < Minitest::Test

    def setup
    end
    def teardown
    end

    def test_minitest_is_ready
        assert_equal 3, 1+2
    end
end

