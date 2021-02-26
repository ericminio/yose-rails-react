class Server
    require 'socket'

    def initialize(port)
        @server = TCPServer.new port
    end
    def start
        Thread.new {
            session = @server.accept
            session.print "HTTP/1.1 200\r\n"
            session.print "Content-Type: application/json\r\n"
            session.print "\r\n"
            session.print "{\"alive\":true}"
            session.close
            sleep 3
        }
    end
    def stop
        @server.shutdown
    end
end