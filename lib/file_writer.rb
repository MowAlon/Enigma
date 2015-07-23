class FileWriter

  def initialize(filename = ARGV[1])
  	@filename = filename
  end

  def write_file(message)
    file = File.open(@filename, 'w')
    file.write(message)
  end

end
