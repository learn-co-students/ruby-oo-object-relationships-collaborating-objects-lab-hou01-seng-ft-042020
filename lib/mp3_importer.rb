require 'pry'

class MP3Importer
  attr_reader :path
  def initialize(file_path)
    @path = file_path
  end 

  def files 
    Dir.entries(@path).select do |f| !File.directory? f end
  end 

  def import 
    self.files.each do |file|
      Song.new_by_filename(file)
    end
  end 

end


