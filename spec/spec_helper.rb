require 'pry'
require_relative "../lib/dwelling"
require_relative "../lib/house"
require_relative "../lib/apartment"
require_relative "../lib/occupant"

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each do |file|
  require File.basename(file, File.extname(file))
end
