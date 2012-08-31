module Mongoid::Simplify::Connection

	#
	# In mongoid >= 3 the methods for connecting changed into something to complex and to
	# complicated. So I reimplemented this way of connecting with an plain URI.
	#
	# @example set the default session
	#		Mongoid.use("mongodb://localhost:27017/database")
	#
	def use(*args)
		args.flatten.each do |arg|
			if arg.kind_of? String
				use_session(:default, arg)
			elsif arg.kind_of? Hash
				arg.each do |name, uri|
					use_session(name.to_sym, uri)
				end
			end
		end
	end

	private 
	def use_session(name, db_uri)
		uri = URI.parse(db_uri)
		sessions = Mongoid::Config.sessions
		sessions[name.to_sym] = { database: mongodb_database(uri), hosts: [ mongodb_host(uri) ] }
	end

	def mongodb_host(uri)
		"#{uri.host}:#{uri.port}"
	end

	def mongodb_database(uri)
		uri.path.delete("/")
	end
	
end 