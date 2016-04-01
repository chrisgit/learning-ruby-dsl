# Code that provides the action for batch resource
require 'tempfile'

module KitchenPorter
	class Execute_Batch < KitchenPorter::Provider
        provides :batch
        
        property :cmd
        allow_actions [:nothing, :run]
        
        def set_defaults
            action(:run)
            @cmd = ''
        end

        # Run the batch command, copy command to batch file, run batch file, remove file
		def run
			return if @cmd.nil? || @cmd.empty?
			file = Tempfile.new(['dsl', '.bat'])
			file.write(@cmd)
			file.close
			system(file.path)
			file.unlink
		end
	end
end
