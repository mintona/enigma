require './test/test_helper'
require_relative '../lib/key'
require_relative '../lib/offset'

class OffsetTest < Minitest::Test
  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_can_get_todays_date
    Date.expects(:today).returns(Date.new(2019,11,2))

    assert_equal "021119", Offset.generate_date
  end

end
