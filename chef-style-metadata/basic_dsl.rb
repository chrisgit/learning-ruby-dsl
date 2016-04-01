# This is the Chef runner

lib = File.join(File.dirname(__FILE__), 'lib')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'provider'

Dir['mixin/*.rb'].each { |f| require File.expand_path(f) }
Dir['providers/*.rb'].each { |f| require File.expand_path(f) }

module KitchenPorter
	class Recipe
		include Mixin::FromFile

		def initialize
			@resourceQueue = []
		end
        
        def add_to_resource_queue(resource)
            @resourceQueue << resource
        end
        
		def run_recipe
			# Execute 
			@resourceQueue.each do |resource|
				resource.run_action
			end
		end
        
        def method_missing(name, *args, &block)
            provider = Provider.get_provider_for(name)
            raise "Provider not found for #{name}" if provider.nil?
            resource = provider.new *args
            resource.instance_eval &block if block_given?
            add_to_resource_queue(resource)
        end
        
	end
end

# Instantiate a Recipe
recipe = KitchenPorter::Recipe.new
# Load the recipe, this is the "compile" phase
recipe.from_file './recipe/basic_recipe.rb'
# Run the recipe, this is the "converge" phase
recipe.run_recipe
