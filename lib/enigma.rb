require './lib/constants'
require './lib/key_generator'
require './lib/crypto'
require './lib/offset_calculator'
require './lib/file_reader'
require './lib/file_writer'
require './lib/cracker'
require './lib/printer'

action = ARGV[0][0].to_sym
ACTIONS = [:e, :d, :c]
input_file = ARGV[1]
output_file = ARGV[2]
message_to_convert = FileReader.new(input_file).message

if ACTIONS.include?(action)
  if action == :e || action == :d
    key = ARGV[3]
    date = ARGV[4]
    offsets = OffsetCalculator.new(date,key).all_combined_offsets

    converted_message = if action == :e
      Crypto.new(message_to_convert, offsets).encrypt
    elsif action == :d
      Crypto.new(message_to_convert, offsets).decrypt
    end
  elsif action == :c
    start_time = Time.now
    offsets = Cracker.new(message_to_convert).cracked_offsets
    converted_message = Crypto.new(message_to_convert, offsets).decrypt
    puts "Cracked in #{Time.now - start_time} seconds."
  end
  FileWriter.new(output_file).write_file(converted_message)
  Printer.new(converted_message, action, key, date).print
else
  puts "\n💩  Invalid input: '#{action}'. Try 'encrypt', 'decrypt', or 'crack'.\n\n"
end
