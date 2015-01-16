module ModuleMapper
  module Map

    def self.from(content:, filename:)
      orig_stderr = $stderr.clone
      orig_stdout = $stdout.clone
      $stderr.reopen File.new('/dev/null', 'w')
      $stdout.reopen File.new('/dev/null', 'w')
      begin
        parser = Analyst.for_source(content)
        containers = parser.top_level_entities.select{|e| e.respond_to? :all_methods}
        containers << containers.map(&:classes)
        containers.flatten!.reject!{ |container| container.all_methods.empty? }
        containers.map do |container|
          {
            module_name: container.full_name,
            filename: filename
          }
        end
      rescue
        containers = [
          {
            module_name: "Unknown",
            filename: filename
          }
        ]
      ensure
        $stdout.reopen orig_stdout
        $stderr.reopen orig_stderr
      end
    end

  end
end