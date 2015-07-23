gem 'minitest', '~> 5.7.0'
require 'minitest/autorun'
require 'minitest/pride'
require './test_helper'

class CrackerTest < Minitest::Test

  def test_it_gets_the_correct_shift_amount
    cracker = Cracker.new("characters..end..")
  	assert_equal 2, cracker.position_shift
  end

  def test_it_snips_the_end_of_the_encrypted_message_with_one_char_per_wheel
    cracker = Cracker.new("hello, world!!")
    assert_equal "rld!!", cracker.snippet("hello, world!!")
  end

  def test_it_snips_the_end_of_the_known_closing_phrase
    cracker = Cracker.new("hello, world!!")
    assert_equal "end..", cracker.snippet(KNOWN_CLOSING)
  end

  def test_it_cracks_a_code
    offsets = Cracker.new("vAes4Mgpv7z\n4ENsJWEN").cracked_offsets
    crypto = Crypto.new("vAes4Mgpv7z\n4ENsJWEN", offsets)
    assert_equal "hello, world...end..", crypto.decrypt
  end

  def test_it_cracks_a_longish_code
    decrypted_message = FileReader.new('./../data/decrypted_message.txt').message
  	message = FileReader.new('./../data/encrypted_message.txt').message
    offsets = Cracker.new(message).cracked_offsets
    crypto = Crypto.new(message, offsets)

    assert_equal decrypted_message, crypto.decrypt
  end

end
