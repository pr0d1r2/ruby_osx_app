# this class describes OSX Application
class OsxApp
  class CannotFind < StandardError; end

  attr_reader :name
  attr_reader :path

  def initialize(name_or_path)
    if File.directory?(name_or_path)
      @name = File.basename(name_or_path).gsub('.app', '')
      @path = name_or_path
    else
      @name = name_or_path.gsub('.app', '')
      @path = "/Applications/#{@name}.app"
      fail CannotFind, @path unless File.directory?(@path)
    end
  end
end
