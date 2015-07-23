class OffsetCalculator
  attr_reader :date_offsets

  def initialize(date, key = nil)
    # @date_key = ('072015'.to_i**2).to_s[-4..-1]
  	@date_offsets = (date.to_i**2).to_s[-WHEELS.size..-1].chars
    @key = key
  end

  def all_combined_offsets
    (0..WHEELS.size - 1).map { |wheel| combined_offset(wheel) }
  end

  def combined_offset(wheel)
  	key_offset(wheel).to_i + date_offset(wheel).to_i
  end

  def key_offset(index)
    if index < 4
    	@key[WHEELS[index]..WHEELS[index] + 1]
    else
      @key[0] + @key[WHEELS[index]]
    end
  end

  def date_offset(index)
    @date_offsets[WHEELS[index]]
  end
end
