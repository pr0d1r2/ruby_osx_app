# this class describes OSX Application
class OsxApp
  class CannotFind < StandardError; end
  class Invalid < StandardError; end

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
    validate!
  end

  def version
    read_defaults('CFBundleShortVersionString')
  end

  def version_major
    version.split('.').first
  end

  def minimum_osx
    read_defaults('LSMinimumSystemVersion')
  end

  private

  def validate!
    fail Invalid, "No #{info_plist}" unless File.exist?(info_plist)
  end

  def info_plist
    "#{path}/Contents/Info.plist"
  end

  def read_defaults(string)
    `defaults read #{info_plist} #{string}`.strip
  end
end
