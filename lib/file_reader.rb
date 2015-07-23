class FileReader

  def initialize(filename = ARGV[0])
  	@filename = filename
  end

  def message
    File.read(@filename)
  end

end
