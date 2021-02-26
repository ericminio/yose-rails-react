require 'socket'

class Server
    
    def initialize(port)
        @server = TCPServer.new port
    end
    def start
        Socket.accept_loop(@server) do |session|
            body = "{\"alive\":true}"
            
            session.print "HTTP/1.1 200\r\n"
            session.print "Content-Type: application/json\r\n"
            session.print "Content-Length: " + body.length.to_s + "\r\n"
            session.print "\r\n"
            session.print body
            session.close
        end
    end
end