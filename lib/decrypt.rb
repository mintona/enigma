require_relative './enigma'
require_relative './shift'
require_relative './key'
require_relative './offset'

ARGV == ['encrypted.txt', 'decrypted.txt', '', '']
ARGV[0] == 'encrypted.txt'
ARGV[1] == 'decrypted.txt'
ARGV[2] == ''
ARGV[3] == ''

encrypted_message = File.open(ARGV[0], "r")
encrypted_text = encrypted_message.readlines.join
encrypted_string = encrypted_text.chomp

enigma = Enigma.new

decryption = enigma.decrypt(encrypted_string, ARGV[2], ARGV[3])

decrypted_text = File.open(ARGV[1], "w")
decrypted_text = decrypted_text.write(decryption[:decryption])

puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"
