module KitchenPorter
	class Log
			
		def initialize description
			@description = description
			@level = :info
			@action = :write
			@message = description
		end
			
		def log(description)
			@description = description
		end
		
		def message(message)
			@message = message
		end
		
		def level(logLevel)
			@logLevel = logLevel
		end
			
		def action(action)
			if [ :nothing, :write ].include?(action)
				@action = action 
			else
				raise "Invalid action passed to Log resource"
			end
		end
			
		# (action = :nothing)
		def run_action
			if (self.respond_to? @action)
				self.send(@action)
			end
		end
		
		def write
			puts "#{@logLevel}: #{@message}"
		end
		
	end
end
