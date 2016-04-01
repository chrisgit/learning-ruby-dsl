module KitchenPorter
	class ProcessTemplate
		attr_accessor :items
		
		def initialize
			@template = ''
			@items = Hash.new
		end

		def variables(template_variables)
			@items = OpenStruct.new(template_variables)
		end
			
		def source(template_file)
            full_path = File.expand_path("templates/#{template_file}")
			@template = open(full_path, 'r') {|f| f.read}
		end
		
		def run_action
			if @template.nil? || @template.empty?
				return
			end
			pTemplate = ERB.new(@template)
			puts output = pTemplate.result(items.instance_eval {binding})
		end
	end
end
