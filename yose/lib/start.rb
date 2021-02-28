require_relative './server'

yose = Server.new ENV["PORT"] || 5001
sleep 3
yose.start