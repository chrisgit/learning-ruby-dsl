# Provider base class
module KitchenPorter
    class Provider

        # Store for registered providers
        @@providers = {}

        # Generate a method to set backing attributes
        def Provider.property(property_name)
            define_method(property_name) do |value|
               instance_variable_set("@#{property_name}", value)
			end
       end

       # Allow actions
       def Provider.allow_actions(valid_actions)
            define_method('allow_actions') do
               valid_actions
			end
       end
       
       # Register the resource provider
       def Provider.provides(provider_name)
            @@providers[provider_name] = self
       end 
      
        # Retrieve the provider
        def Provider.get_provider_for(provider_name)
            @@providers[provider_name]
        end
      
        # Constructor for Provider, 
      	def initialize description
			@description = description
            set_defaults if respond_to?(:set_defaults)
		end

        # Set the action
       def action(action)
            if allow_actions.include?(action)
                @action = action
            else
                raise "Action of #{action} is not valid for #{self.class}"
            end 
       end

       # Default allow actions
        def allow_actions
            [:nothing]
        end
        
        # Run the action (converge phase)
		def run_action
            raise "Action for resource #{self.class} is nil!" if @action.nil?
			if (self.respond_to? @action)
				self.send(@action)
			end
		end
	
	end
end
