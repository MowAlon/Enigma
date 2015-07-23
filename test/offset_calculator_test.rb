gem 'minitest', '~> 5.7.0'
require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'

class OffsetCalculatorTest < Minitest::Test
  attr_reader :offset

  def setup
  	@offset = OffsetCalculator.new('220715', '13571')
  end

  def test_the_date_offset_for_wheel_a
  	# 072015^2 = 5186160225 ... last four: 0225
    assert_equal '1', offset.date_offset(0)
  end

  def test_the_date_offset_for_wheel_b
    assert_equal '1', offset.date_offset(1)
  end

  def test_the_date_offset_for_wheel_c
    assert_equal '2', offset.date_offset(2)
  end

  def test_the_date_offset_for_wheel_d
    assert_equal '2', offset.date_offset(3)
  end

  def test_the_date_offset_for_wheel_e
    assert_equal '5', offset.date_offset(4)
  end

  def test_the_key_offset_for_wheel_a
    assert_equal '13', offset.key_offset(0)
  end

  def test_the_key_offset_for_wheel_b
    assert_equal '35', offset.key_offset(1)
  end

  def test_the_key_offset_for_wheel_c
    assert_equal '57', offset.key_offset(2)
  end

  def test_the_key_offset_for_wheel_d
    assert_equal '71', offset.key_offset(3)
  end

  def test_the_key_offset_for_wheel_e
    assert_equal '11', offset.key_offset(4)
  end

  def test_the_total_offset_for_wheel_a
    assert_equal 14, offset.combined_offset(0)
  end

  def test_the_total_offset_for_wheel_b
    assert_equal 36, offset.combined_offset(1)
  end

  def test_the_total_offset_for_wheel_c
    assert_equal 59, offset.combined_offset(2)
  end

  def test_the_total_offset_for_wheel_d
    assert_equal 73, offset.combined_offset(3)
  end

  def test_the_total_offset_for_wheel_e
    assert_equal 16, offset.combined_offset(4)
  end

  def test_returns_full_array_of_offsets
  	assert_equal [14, 36, 59, 73, 16], offset.all_combined_offsets
  end

end
