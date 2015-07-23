class Crypto
  attr_reader :message, :offsets

  def initialize(message, offsets)
  	@message = message
    @offsets = offsets
  end

  def decrypt
  	encrypt(-1)
  end

  def encrypt(decrypt_modifier = 1)
    message.chars.map.with_index do |character, wheel_index|
      CHARACTER_MAP[character_index(character, wheel_index, decrypt_modifier)]
    end.join
  end

  def character_index(character, wheel_index, decrypt_modifier = 1)
    (CHARACTER_MAP.index(character) + decrypt_modifier * (offsets[wheel_index % WHEELS.size])) % CHARACTER_MAP.size
  end
end
