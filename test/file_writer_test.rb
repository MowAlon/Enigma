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

  def test_it_writes_a_file_when_filename_is_given_as_second_arg_in_command_line
    writer = FileWriter.new(ARGV[1])
    message = "this is only a test. BAM!"
    writer.write_file(message)
    message_read = FileReader.new(ARGV[1]).message

    assert_equal "this is only a test. BAM!", message_read
  end


end
