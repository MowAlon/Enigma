require './../test/test_helper'
class Cracker

  def cracked_offsets(encrypted_message)#, date = nil)

    wheel_offset = encrypted_message.size % WHEELS.size
    known_snippet = snippet(KNOWN_CLOSING, wheel_offset)
    encrypted_snippet = snippet(encrypted_message, wheel_offset)
    hint_start_position = -WHEELS.size - wheel_offset
    # date = Time.now.strftime("%d%m%y") if date == nil
    # date_offsets = OffsetCalculator.new(date).date_offsets

    encrypted_snippet.map.with_index do |encrypted_char, index|
      (CHARACTER_MAP.index(encrypted_char) - CHARACTER_MAP.index(known_snippet[index])) % CHARACTER_MAP.size
    end
  end

  def snippet(string, wheel_offset)
  	string.slice(-WHEELS.size - wheel_offset..-1 - wheel_offset).chars
  end

end

cracker = Cracker.new
offsets = cracker.cracked_offsets("y6lY5a j5FlQOZ.R45.y")#, "200715")
cracked_message = Crypto.new("y6lY5a j5FlQOZ.R45.y", offsets).decrypt
require 'pry';binding.pry
puts cracked_message
