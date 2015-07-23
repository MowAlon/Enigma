require './../test/test_helper'

new_message_file = ARGV[0]
encrypted_file = ARGV[1]

key = KeyGenerator.new(14916).value
date = Time.now.strftime("%d%m%y")
offsets = OffsetCalculator.new(date,key).all_combined_offsets

message_to_encrypt = FileReader.new(new_message_file).message
encrypted_message = Crypto.new(message_to_encrypt, offsets).encrypt
FileWriter.new(encrypted_file).write_file(encrypted_message)

Printer.new(encrypted_message, :e, key, date).print
