gem 'minitest', '~> 5.7.0'
require 'minitest/autorun'
require 'minitest/pride'
require './test_helper'

class FileWriterTest < Minitest::Test

  def test_it_actually_writes_a_file
    writer = FileWriter.new('./../data/write_test.txt')
    message = "this is only a test. BAM!"
    writer.write_file(message)
    message_read = FileReader.new('./../data/write_test.txt').message

    assert_equal "this is only a test. BAM!", message_read
  end

  def test_it_writes_to_filename_given_in_command_line
    writer = FileWriter.new
    message = "this is only a test. BAM!"
    writer.write_file(message)
    message_read = FileReader.new(ARGV[0]).message

    assert_equal "this is only a test. BAM!", message_read
  end

end
