require_relative './enigma'
require_relative './shift'
require_relative './key'
require_relative './offset'
require_relative './file_io'
include FileIO

ARGV == ['encrypted.txt', 'decrypted.txt', 'key', 'date']
ARGV[0] == 'encrypted.txt'
ARGV[1] == 'decrypted.txt'
ARGV[2] == 'key'
ARGV[3] == 'date'

message = read_message(ARGV[0])
enigma = Enigma.new
decryption = enigma.decrypt(message, ARGV[2], ARGV[3])

write_message(ARGV[1], decryption[:decryption])

puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"
