require 'thor'
require 'module_mapper'

module ModuleMapper

  class CLI < Thor

    desc "map PATHS_TO_FILES", "Parse files and return a map of module names and filename"

    def map(path, *more_paths)
      paths = [path] + more_paths
      ModuleMapper.new(paths).report
    end

    private

    def formatter
      options['format'] && options['format'].to_sym || :text
    end

  end

end
