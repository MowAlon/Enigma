require './../test/test_helper'

encrypted_file = ARGV[0]
decrypted_file = ARGV[1]

key = KeyGenerator.new(14916).value
date = Time.now.strftime("%d%m%y")
offsets = OffsetCalculator.new(date,key).all_combined_offsets
# offset = OffsetCalculator.new('200715',key)

message_to_decrypt = FileReader.new(encrypted_file).message.chomp
decrypted_message = Crypto.new(message_to_decrypt, offsets).decrypt
FileWriter.new(decrypted_file).write_file(decrypted_message)

puts "Decryption complete using key #{key} and date #{date}. Find decrypted message in '#{ARGV[1]}'."
