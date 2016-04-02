
#Add src/ folder to the ruby LOAD_PATH, inorder to require src code
src  = File.expand_path("../../src", __FILE__)
$:.unshift(src)

require 'test/unit' 
require 'babySitter'

class BabySitterTest < Test::Unit::TestCase

	def test_pay_from_start_to_bedtime
		babysitter = BabySitter.new(18, 4, 21)
		assert_equal(36, babysitter.receives_12_per_hour())
	end

	def test_pay_from_bedtime_to_midnight
		babysitter = BabySitter.new(18, 4, 21)
		assert_equal(24, babysitter.receives_8_per_hour())
	end
end
