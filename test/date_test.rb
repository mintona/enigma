require './test/test_helper'
require_relative '../lib/key'
require_relative '../lib/date'

class OffsetTest < Minitest::Test
  def setup
    @date = Date.new
  end

  def test_it_exists
    assert_instance_of Date, @date
  end

  def test_it_can_get_todays_date
    Date.expects(:today).returns(Date.new(2019,11,2))

    assert_equal "021119", Date.generate_date
  end

end
