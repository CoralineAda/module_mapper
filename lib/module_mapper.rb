require 'json'
require 'fileutils'
require 'analyst'

module ModuleMapper

  def self.new(paths_to_files)
    ModuleMapper::Parser.new(paths_to_files)
  end

end