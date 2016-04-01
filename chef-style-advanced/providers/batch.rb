module KitchenPorter
	class Execute_Batch
		def initialize description
			@description = description
			@action = :run
			@cmd = ''
		end

		def cmd(cmd)
			@cmd = cmd
		end

		def action(action)
			if [ :nothing, :run ].include?(action)
				@action = action 
			else
				raise "Invalid action passed to Log resource"
			end
		end

		
		def run_action
			if @cmd.nil? || @cmd.empty?
				return
			end
			if (self.respond_to? @action)
				self.send(@action)
			end
		end
		
		def run
			file = Tempfile.new(['dsl', '.bat'])
			#puts file.path 
			file.write(@cmd)
			file.close
			system(file.path)
			file.unlink
		end
	end
end
