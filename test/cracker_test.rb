gem 'minitest', '~> 5.7.0'
require 'minitest/autorun'
require 'minitest/pride'
require './test_helper'

class CrackerTest < Minitest::Test

  def test_it_gets_the_correct_shift
    cracker = Cracker.new("characters..end..")
  	assert_equal 1, cracker.position_shift
  end

  def test_it_grabs_the_proper_snippet_with_shift
    cracker = Cracker.new("hello, world!!")
    shift = cracker.position_shift
    assert_equal "orld", cracker.snippet("hello, world!!", shift)
  end

  def test_it_cracks_a_code
    offsets = Cracker.new("y6lY5a j5FlQOZ.R45.y").cracked_offsets
    crypto = Crypto.new("y6lY5a j5FlQOZ.R45.y", offsets)
    assert_equal "hello, world...end..", crypto.decrypt
  end

end
