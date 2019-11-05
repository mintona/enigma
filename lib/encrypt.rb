require_relative './enigma'
require_relative './shift'
require_relative './key'
require_relative './offset'

ARGV == ['message.txt', 'encrypted.txt']
ARGV[0] == 'message.txt'
ARGV[1] == 'encrypted.txt'

message = File.open(ARGV[0], "r")
message_text = message.readlines.join
message_string = message_text.chomp

# key = Key.generate_number
# date = Offset.generate_date

enigma = Enigma.new

encryption = enigma.encrypt(message_string)
# encryption = enigma.encrypt(message_string, key, date)
encrypted_text = File.open(ARGV[1], "w")
encrypted_text = encrypted_text.write(encryption[:encryption])

puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
