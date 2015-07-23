gem 'minitest', '~> 5.7.0'
require 'minitest/autorun'
require 'minitest/pride'
require './test_helper'


class CryptoTest < Minitest::Test
  attr_reader :encryptor, :offsets

  def setup
    @offsets = OffsetCalculator.new("200715", "82648").all_combined_offsets
    @encryptor = Crypto.new("hello, world.", offsets)
  end

  def test_it_finds_a_character_index
    assert_equal 50, encryptor.character_index('h', 0)
  end

  def test_it_finds_a_character_index_on_a_different_wheel
    assert_equal 26, encryptor.character_index(',', 1)
  end

  def test_it_encrypts_a_message
    assert_equal "y6lY5a j5FlQO", encryptor.encrypt
  end

  def test_it_decrypts_a_message
    decryptor = Crypto.new("y6lY5a j5FlQO", [83,28,66,53])

    assert_equal "hello, world.", decryptor.decrypt
  end

end
