require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "Babe_Ruth"
channel = "#bitmaker"
greeting_prefix = "privmsg #bitmaker :"
sports_prefix = "privmsg #bitmaker :"
greetings = ["hello", "hi", "holla"]
sports = ["baseball", "basketball", "football", "hockey", "raptors", "blue jays", "leafs"]

irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhellobot 0 * BHelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
#irc_server.puts "PRIVMSG #{channel} :Hello from IRB Bot"

# Hello, Bot!
until irc_server.eof? do
  msg = irc_server.gets.downcase
  puts msg

  if msg == "hello"
    file = File.new("./homer.txt", "r")
    while (line = file.gets)
      irc_server.puts "PRIVMSG #{channel} :#{line}"
    end
  end


  #checks for greetings#######################
  # wasGreeted = false
  # greetings.each do |g|
	 #   wasGreeted = true if msg.include? g
  # end

  # if msg.include?(greeting_prefix) and wasGreeted
  #   response = "The Babe says hello. NOW WHERE'S MY DRINK FOOL?!?!"
  # 	5.times do
  # 	 irc_server.puts "PRIVMSG #{channel} :#{response}"
  #   end
    ##########################################

  #checks for sports#######################
  # wasSports = false
  # sports.each { |g| wasSports = true if msg.include? g }
  #   file = File.new("./sweet_as_pie.txt", "r")
  #   while (line = file.gets)
  #    irc_server.puts "PRIVMSG #{channel} :#{line}"
  #   end
  # # end
  # #file.close
  #    # irc_server.puts "PRIVMSG #{channel} #{File.read("sweet_as_pie.txt")}"
  #   ##########################################
  # #end
end
