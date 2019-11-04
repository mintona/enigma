require './lib/enigma'
require './lib/shift'
require './lib/key'
require './lib/offset'

ARGV == ['message.txt', 'encrypted.txt']
ARGV[0] == 'message.txt'
ARGV[1] == 'encrypted.txt'

message = File.open(ARGV[0], "r")
message_text = message.readlines.join
message_string = message_text.chomp

key = Key.generate_number
date = Offset.generate_date

enigma = Enigma.new

encryption = enigma.encrypt(message_string, key, date)

encrypted_text = File.open(ARGV[1], "w")
encrypted_text = encrypted_text.write(encryption[:encryption])

puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
