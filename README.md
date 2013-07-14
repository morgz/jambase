# Jambase

This is a simple wrapper over the Jambase v3 API: http://developer.jambase.com/

## Installation

Add this line to your application's Gemfile:

    gem 'jambase', :github => 'brasic/jambase'

And then execute:

    $ bundle

## Usage

    require 'jambase'
    api = Jambase::Api.new(YOUR_API_KEY)
    # See lib/jambase/api.rb and developer.jambase.com for the full list


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
