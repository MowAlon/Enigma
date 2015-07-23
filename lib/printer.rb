class Printer
  attr_reader :message, :method, :key, :date

  def initialize(message, method, key = nil, date = nil)
  	@message = message
    @method = method
    @key = key
    @date = date
  end

  def build_output
    if method == :e || method == :d
      if method == :e
        prefix1 = "Encryption complete using key #{key} and date #{date}."
        prefix2 = "Encrypted"
      else
        prefix1 = "Decryption complete using key #{key} and date #{date}."
        prefix2 = "Decrypted"
      end
    else
      prefix1 = "Cracking complete without any key or date!"
      prefix2 = "Cracked"
    end
    return prefix1, prefix2
  end

  def print
    prefix1, prefix2 = build_output
    puts "\n#{prefix1} Message follows:\n\n"
    puts "---BEGIN---\n#{message}\n---END---\n\n"
    puts "#{prefix2} message has been saved in '#{ARGV[1]}'.\n\n"
  end
end
