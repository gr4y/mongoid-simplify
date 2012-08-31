require "mongoid-simplify/version"
require "mongoid-simplify/connection"
module Mongoid
	extend Mongoid::Simplify::Connection

end
