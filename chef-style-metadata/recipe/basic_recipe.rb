# This is equivalent of a Chef recipe

log "HelloWorld" do
	message "Hello World"
	level :info
end

log "GoodbyeWorld" do
	message "Goodbye World"
	level :info
	action :write
end

log "One" do
	message "One"
	level :info
end

batch "list folder" do
	cmd <<-START
		cd C:/Temp
		dir > out.txt
	START
end

template "basic template" do
	source "simple_template.erb"
	variables({ :motd => "The Quick Brown Fox Jumps Over The Lazy Dog", :salutation => "User", :copywrite => "NewVoiceMedia" })
end