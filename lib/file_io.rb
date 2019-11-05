module FileIO

  def read_message(file_path)
    message = File.open(file_path, "r")
    message_text = message.readlines.join
    message_text.chomp
  end

  def write_message(file_path, message)
    to_be_written = File.open(file_path, "w")
    to_be_written.write(message)
  end

end
