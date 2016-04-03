
#Add src/ folder to the ruby LOAD_PATH, inorder to require src code
src  = File.expand_path("../../src", __FILE__)
$:.unshift(src)

require 'test/unit' 
require 'babySitter'

class BabySitterTest < Test::Unit::TestCase

	def setup
		@sitter = BabySitter.new(17, 20, 4)
	end

	def test_pay_from_start_to_bedtime

		assert_equal(36, @sitter.receives_12_start_to_bedtime())
	end

	def test_pay_from_bedtime_to_midnight
		assert_equal(32, @sitter.receives_8_bedtime_to_midnight())
	end

	def test_pay_from_midnight_to_end
		assert_equal(64, @sitter.receives_16_midnight_to_end())
	end

	def test_total_pay
		assert_equal(132, @sitter.calculate())		
	end
end


#Also tested with other inputs listed below

#@sitter = BabySitter.new(17, 20,4)
#@sitter = BabySitter.new(21, 20,4)
#@sitter = BabySitter.new(24, 20,4)
#@sitter = BabySitter.new(1, 20,4)
#@sitter = BabySitter.new(4, 20,4)
#@sitter = BabySitter.new(17, 20,22)
#@sitter = BabySitter.new(21, 20,22)
#@sitter = BabySitter.new(20, 20, 22)
#@sitter = BabySitter.new(17, 20,20)
#@sitter = BabySitter.new(17, 20, 19)