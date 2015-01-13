require 'json'
require 'fileutils'
require 'analyst'

require_relative "module_mapper/file_reader"
require_relative "module_mapper/map"
require_relative "module_mapper/parser"

module ModuleMapper

  def self.new(paths_to_files)
    ModuleMapper::Parser.new(paths_to_files)
  end

end