# Load some default modules
['rubygems','json','time','date','pp'].each do |mod|
  begin
    require mod
  rescue LoadError
    puts "Error loading #{mod}"
    next
  end
end

# Configure colours and history
begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError
  puts "Tip: install the wirble gem for some colours!"
  require 'irb/completion'
  require 'irb/ext/save-history'
end
IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

# Make the prompt nice
IRB.conf[:PROMPT][:CUSTOM] = {
    :PROMPT_I => "IRB> ",
    :PROMPT_C => "   > ",
    :PROMPT_N => "  >> ",
    :PROMPT_S => "   | ",
    :RETURN => "%s\n"
}
IRB.conf[:PROMPT_MODE] = :CUSTOM

# Computer-specific stuff
require 'socket'
case Socket.gethostbyname(Socket.gethostname).first
  when /\.snowmen\.se$/ then load "#{ENV['HOME']}/.irbrc.work"
end

if RUBY_VERSION =~ /^1\.8/

  class Object
    undef_method :id
  end

end
