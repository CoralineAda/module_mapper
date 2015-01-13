module ModuleMapper

  class Parser

    attr_reader :paths_to_files

    def initialize(paths_to_files)
      @paths_to_files = paths_to_files
    end

    private

    def file_reader
      @file_reader ||= ModuleMapper::FileReader.new(self.paths_to_files)
    end

    def map!
      @map ||= file_reader.source_files.map do |source_file|
        ModuleMapper::Map.from(
          source_file: source_file.filename,
          content: source_file.contents
        )
      end.flatten
    end

  end

end