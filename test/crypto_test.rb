gem 'minitest', '~> 5.7.0'
require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'


class CryptoTest < Minitest::Test
  attr_reader :encryptor, :offsets

  def setup
    @offsets = OffsetCalculator.new("220715", "13571").all_combined_offsets
    @encryptor = Crypto.new("hello, world...end..", offsets)
  end

  def test_it_finds_a_characters_offset_index
    assert_equal 47, encryptor.character_index('h', 0)
  end

  def test_it_finds_a_character_index_on_a_different_wheel
    assert_equal 34, encryptor.character_index(',', 1)
  end

  def test_it_encrypts_a_message
    assert_equal "vAes4Mgpv7z\n4ENsJWEN", encryptor.encrypt
  end

  def test_it_decrypts_a_message
    decryptor = Crypto.new("vAes4Mgpv7z\n4ENsJWEN", [14, 36, 59, 73, 16])

    assert_equal "hello, world...end..", decryptor.decrypt
  end

end
