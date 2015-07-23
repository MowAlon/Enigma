gem 'minitest', '~> 5.7.0'
require 'minitest/autorun'
require 'minitest/pride'
require './test_helper'


class FileReaderTest < Minitest::Test

  def test_it_returns_the_chomped_text_from_a_file_when_passed_a_filename
    text = FileReader.new('./../data/simple_message.txt').message
    assert_equal "hello, world...end..", text
  end

  def test_it_returns_the_chomped_text_from_a_file_given_in_command_line
    skip
    #Include this file in command line: ./../data/simple_message_borris.txt
    text = FileReader.new.message
    assert_equal "hello, Borris...end..", text
  end

end
