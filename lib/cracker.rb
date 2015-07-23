# require './../test/test_helper'
class Cracker
  attr_reader :encrypted_message

  def initialize(encrypted_message)
  	@encrypted_message = encrypted_message
  end

  def cracked_offsets
    encrypted_snippet = snippet(encrypted_message, position_shift)
    known_snippet = snippet(KNOWN_CLOSING, position_shift)
    encrypted_snippet.chars.map.with_index do |encrypted_char, index|
      (CHARACTER_MAP.index(encrypted_char) - CHARACTER_MAP.index(known_snippet[index])) % CHARACTER_MAP.size
    end
  end

  def position_shift
    encrypted_message.size % WHEELS.size
  end

  def snippet(string, position_shift)
  	string.slice(-WHEELS.size - position_shift..-1 - position_shift)
  end

end
