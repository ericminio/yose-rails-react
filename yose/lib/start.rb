require_relative './server'

yose = Server.new ENV["PORT"] || 5001
yose.start