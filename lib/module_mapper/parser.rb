module ModuleMapper

  class Parser

    attr_reader :paths_to_files

    def initialize(paths_to_files)
      @paths_to_files = paths_to_files
    end

    def report
      module_map.each do |mmap|
        puts "#{mmap[:filename]}\t#{mmap[:module_name]}"
      end
    end

    private

    def file_reader
      @file_reader ||= ModuleMapper::FileReader.new(self.paths_to_files)
    end

    def module_map
      @map ||= file_reader.source_files.map do |source_file|
        ModuleMapper::Map.from(
          filename: source_file.filename,
          content: source_file.contents
        )
      end.flatten
    end

  end

end