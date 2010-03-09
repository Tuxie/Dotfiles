['rubygems','json','time','date','pp'].each do |mod|
  begin
    require mod
  rescue LoadError
    next
  end
end

begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError
  require 'irb/completion'
  require 'irb/ext/save-history'
end

IRB.conf[:PROMPT][:CUSTOM] = {
    :PROMPT_I => "IRB> ",
    :PROMPT_C => "   > ",
    :PROMPT_N => "  >> ",
    :PROMPT_S => "   | ",
    :RETURN => "%s\n"
}
IRB.conf[:PROMPT_MODE] = :CUSTOM


require 'socket'
HOSTNAME = Socket.gethostbyname(Socket.gethostname).first

case HOSTNAME
  when /\.snowmen\.se$/ then load "#{ENV['HOME']}/.irbrc.work"
end

