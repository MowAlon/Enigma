require './lib/constants'
require './lib/key_generator'
require './lib/crypto'
require './lib/offset_calculator'
require './lib/file_reader'
require './lib/file_writer'
require './lib/cracker'
require './lib/printer'

encrypted_file = ARGV[0]
cracked_file = ARGV[1]

message_to_crack = FileReader.new(encrypted_file).message
offsets = Cracker.new(message_to_crack).cracked_offsets

cracked_message = Crypto.new(message_to_crack, offsets).decrypt
FileWriter.new(cracked_file).write_file(cracked_message)

Printer.new(cracked_message, :c).print
