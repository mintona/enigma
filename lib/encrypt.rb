require_relative './enigma'
require_relative './shift'
require_relative './key'
require_relative './offset'
require_relative './file_io'

include FileIO

ARGV == ['message.txt', 'encrypted.txt']
ARGV[0] == 'message.txt'
ARGV[1] == 'encrypted.txt'

message_string = read_message(ARGV[0])
# message_string = FileIO.read_message(ARGV[0])

key = Key.generate_number
date = Offset.generate_date

enigma = Enigma.new

encryption = enigma.encrypt(message_string, key, date)

# FileIO.write_message(ARGV[1], encryption[:encryption])
write_message(ARGV[1], encryption[:encryption])

puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
