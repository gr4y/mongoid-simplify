require 'spec_helper'

MASTER_URI = "mongodb://localhost/simplify_master"
SLAVE_URI = "mongodb://localhost:27017/simplify_slave"

describe Mongoid::Simplify::Connection do 

	describe "#use" do 

		after do 
			Mongoid::Config.sessions.clear
		end

		describe "when passed an uri as an string" do 

			before do 
				Mongoid.use(MASTER_URI)
			end

			it "should have some sessions configured" do 
				Mongoid::Config.sessions.wont_be_nil
				Mongoid::Config.sessions.wont_be_empty
			end

			it "should have an default session configured" do 
				Mongoid::Config.sessions[:default].wont_be_nil
				Mongoid::Config.sessions.has_key?(:default).must_equal true
				Mongoid::Config.sessions[:default].must_equal :database => 'simplify_master', :hosts => ['localhost:27017']
			end

			it "shouldn't have an session named slave configured" do 
				Mongoid::Config.sessions[:slave].must_be_nil
				Mongoid::Config.sessions.has_key?(:slave).must_equal false
			end

		end

		describe "when passed an list sessions as an array" do 

			before do 
				Mongoid.use(:default => MASTER_URI, :slave => SLAVE_URI)
			end

			it "should have some sessions configured" do 
				Mongoid::Config.sessions.wont_be_nil
				Mongoid::Config.sessions.wont_be_empty
			end

			it "should have sessions named slaves and default configured" do 
				Mongoid::Config.sessions.has_key?(:default).must_equal true
				Mongoid::Config.sessions.has_key?(:default).must_equal true
			end

		end

	end

end