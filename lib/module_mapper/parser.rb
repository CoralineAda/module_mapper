module ModuleMapper

  class Parser

    attr_reader :paths_to_files

    def initialize(paths_to_files)
      @paths_to_files = paths_to_files
    end

    def report
      file_reader.source_files.each do |source_file|
        maps(source_file).each do |mmap|
          puts "#{mmap[:filename]}\t#{mmap[:module_name]}"
        end
      end
    end

    private

    def maps(source_file)
      ModuleMapper::Map.from(filename: source_file.filename, content: source_file.contents)
    end

    def file_reader
      @file_reader ||= ModuleMapper::FileReader.new(self.paths_to_files)
    end

  end

end