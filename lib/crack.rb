require './../test/test_helper'

encrypted_file = ARGV[0]
cracked_file = ARGV[1]

message_to_crack = FileReader.new(encrypted_file).message.chomp
offsets = Cracker.new(message_to_crack).cracked_offsets

cracked_message = Crypto.new(message_to_crack, offsets).decrypt
FileWriter.new(cracked_file).write_file(cracked_message)

puts "Cracking complete. Cracked message is in '#{ARGV[1]}'."
