require './../test/test_helper'

new_message_filename = ARGV[0]
encrypted_file = ARGV[1]

key = KeyGenerator.new(14916).value
date = Time.now.strftime("%d%m%y")
offsets = OffsetCalculator.new(date,key).all_combined_offsets
# offset = OffsetCalculator.new('200715',key)

message_to_encrypt = FileReader.new(new_message_filename).message.chomp
encrypted_message = Crypto.new(message_to_encrypt, offsets).encrypt
FileWriter.new(encrypted_file).write_file(encrypted_message)

puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
