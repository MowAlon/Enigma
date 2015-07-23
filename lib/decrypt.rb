require './../test/test_helper'

encrypted_file = ARGV[0]
decrypted_file = ARGV[1]

key = KeyGenerator.new(14916).value
date = Time.now.strftime("%d%m%y")
offsets = OffsetCalculator.new(date,key).all_combined_offsets

message_to_decrypt = FileReader.new(encrypted_file).message
decrypted_message = Crypto.new(message_to_decrypt, offsets).decrypt
FileWriter.new(decrypted_file).write_file(decrypted_message)

Printer.new(decrypted_message, :d, key, date).print
