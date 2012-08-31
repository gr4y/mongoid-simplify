# Mongoid::Simplify

mongoid-simply is a dumb little monkey-patch, packaged into an gem, to restore good old functionality from mongoid 2 in mongoid 3.x 

## Installation

Add this line to your application's Gemfile:

    gem 'mongoid-simplify'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid-simplify

## Usage

In mongoid 2.x there was an an method called `use`, which took an plain URI to your mongodb instance. In mongoid 3.x this functionality disappeared and the new way was configuring mongoid through an mongoid.yml file. I don't liked this approach, so I took the initiative and built this little gem. 

	Mongoid.use("mongodb://localhost:27017/database")

This sets the default session to the given mongodb instance and the database.

You may ask yourself: Nice, but what's with clustering? 
I even thought about this and came around with this approach: 

	Mongoid.use(:default => "mongodb://localhost:27017/database")


Why I don't have forked mongoid and created an pull request: 
My spare time is limited and I don't wanted to discuss this with the whole world. I just needed that functionality back, so I hacked it together, wrote some test cases and packaged it into an gem. 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
