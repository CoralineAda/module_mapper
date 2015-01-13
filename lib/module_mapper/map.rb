module ModuleMapper
  module Map

    def self.from(content:, filename:)
      parser = Analyst.for_source(content)

      containers = parser.top_level_entities.select{|e| e.respond_to? :all_methods}
      containers << containers.map(&:classes)
      containers.flatten!.reject!{ |container| container.all_methods.empty? }

      containers.map do |container|
        {
          module_name: container.full_name,
          filename: source_file
        }
      end
    end

  end
end