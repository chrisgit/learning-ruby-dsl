# Code that provides action for log
module KitchenPorter
	class Log < KitchenPorter::Provider
        provides :log
        
        property :description
        property :message
        property :level
        allow_actions [:nothing, :write]
        
        def set_defaults
            action(:write)
			@level = :info
			@message = @description
		end

        # Write action, output message to console
		def write
			puts "#{@level}: #{@message}"
		end
		
	end
end
