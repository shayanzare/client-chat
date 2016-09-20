#!/usr/bin/env ruby -w
require "socket"


class Client
  def initialize( server )
    puts '''
    ___________________________________________
    |                                           |
    |         Client Chat Version 1.0.0         |
    |                                           |
    |             Coded By ViRuS007             |
    |___________________________________________|

    [ * ] Wairting for connect..

    '''
    @server = server
    @request = nil
    @response = nil
    listen
    send
    @request.join
    @response.join
  end
 
  def listen
    @response = Thread.new do
      loop {
        msg = @server.gets.chomp
        puts "#{msg}"
      }
    end
  end
 
  def send
    puts "[ ? ] Enter the username:"
    @request = Thread.new do
      loop {
        msg = $stdin.gets.chomp
        @server.puts( msg )
      }
    end
  end
end
 
######################################################################################################
#  
# =>                  CONFIG YOUR IP AND PORT LIKE SERVER 
# 

$ip = "192.168.1.102"
port = 5000

server = TCPSocket.open( $ip , port )
Client.new( server )
