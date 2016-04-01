# Code that provides action for Template
require 'erb'
require 'ostruct'

module KitchenPorter
	class ProcessTemplate < KitchenPorter::Provider
        provides :template
        
		attr_accessor :items
		allow_actions [:nothing, :create]
        
		def set_defaults
            action(:create)
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
		
        # Create action, load template, merge it with structure (variables)
		def create
			if @template.nil? || @template.empty?
				return
			end
			pTemplate = ERB.new(@template)
			generated_document = pTemplate.result(items.instance_eval {binding})
            puts generated_document
		end
	end
end
