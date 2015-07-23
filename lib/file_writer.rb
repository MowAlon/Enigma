class FileWriter

  def initialize(filename = ARGV[0])
  	@filename = filename
  end

  def write_file(message)
    file = File.open(@filename, 'w')
    file.write(message)
    file.close
  end

end
