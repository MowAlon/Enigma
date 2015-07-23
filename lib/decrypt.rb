require './lib/constants'
require './lib/key_generator'
require './lib/crypto'
require './lib/offset_calculator'
require './lib/file_reader'
require './lib/file_writer'
require './lib/cracker'
require './lib/printer'

encrypted_file = ARGV[0]
decrypted_file = ARGV[1]
key = ARGV[2]
date = ARGV[3]

offsets = OffsetCalculator.new(date,key).all_combined_offsets

message_to_decrypt = FileReader.new(encrypted_file).message
decrypted_message = Crypto.new(message_to_decrypt, offsets).decrypt
FileWriter.new(decrypted_file).write_file(decrypted_message)

Printer.new(decrypted_message, :d, key, date).print
