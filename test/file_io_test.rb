require './test/test_helper'
require_relative '../lib/file_io'

##How is this tested if it's a module?
class FileIOTest < Minitest::Test

  def test_it_can_create_a_message_string_from_file
    file_path = "message_test.txt"

    assert_equal "Hello! This is the message test.", FileIO.read_message(file_path)

  end

end
