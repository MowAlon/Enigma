class KeyGenerator
  attr_reader :value

  def initialize(value = rand(100000))
    @value = value.to_s.rjust(5,'0')
  end
end
