require_relative './enigma'
require_relative './shift'
require_relative './key'
require_relative './offset'
require_relative './file_io'
include FileIO

ARGV == ['message.txt', 'encrypted.txt']
ARGV[0] == 'message.txt'
ARGV[1] == 'encrypted.txt'

message = read_message(ARGV[0])
enigma = Enigma.new
encryption = enigma.encrypt(message)

write_message(ARGV[1], encryption[:encryption])

puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
