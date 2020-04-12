class MusicLibraryController
  attr_accessor :path
  
  def initialize(path)
    importer = MusicImporter.new(path)
  end

  def call
  end

end
