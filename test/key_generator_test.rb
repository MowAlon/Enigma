gem 'minitest', '~> 5.7.0'
require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'

class KeyGeneratorTest < Minitest::Test

  def test_it_returns_a_five_digit_key_when_given_a_number_up_to_9999
    key = KeyGenerator.new(12345)

    assert_equal '12345', key.value
  end

  def test_it_returns_a_five_digit_key_for_numbers_under_1000
    key = KeyGenerator.new(1234)

    assert_equal '01234', key.value
  end

  def test_it_can_generate_a_random_key
    # Jeff's example below
    # key = KeyGenerator.new
    #
    # results = 5.times.map do
    #   KeyGenerator.value
    # end
    #
    # assert result.uniq.count > 1
    assert key.value.to_i.between?(0,99999)
  end

  def test_for_random_key_2
    key = KeyGenerator.new

    assert key.value.to_i.between?(0,99999)
  end

  def test_for_random_key_3
    key = KeyGenerator.new

    assert key.value.to_i.between?(0,99999)
  end

end
