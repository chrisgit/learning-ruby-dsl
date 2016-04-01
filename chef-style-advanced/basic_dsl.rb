Dir['mixin/*.rb'].each { |f| require File.expand_path(f) }
Dir['providers/*.rb'].each { |f| require File.expand_path(f) }

require 'tempfile'
require 'erb'
require 'ostruct'

module KitchenPorter
	class Recipe
		include Mixin::FromFile

		def initialize
			@resourceQueue = []
		end
		
		def log(description, &block)
			l = KitchenPorter::Log.new description
			l.instance_eval &block
			@resourceQueue << l
		end

		def batch(description, &block)
			b = KitchenPorter::Execute_Batch.new description
			b.instance_eval &block
			@resourceQueue << b
		end

		def template(description, &block)
			t = KitchenPorter::ProcessTemplate.new
			t.instance_eval &block
			@resourceQueue << t
		end
				
		def run_recipe
			# Execute 
			@resourceQueue.each do |resource|
				resource.run_action
			end
		end
	end
end

recipe = KitchenPorter::Recipe.new
recipe.from_file './recipe/basic_recipe.rb'
recipe.run_recipe
