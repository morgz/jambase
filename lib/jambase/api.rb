module Jambase
  class Api
    attr_accessor :connection

    def initialize(api_key)
      @connection = Connection.new(api_key)
    end

    def events_by_zip(zip)
      Events.by_zip(zip, @connection)
    end

    def venue_by_id(id)
      Venue.new( @connection.get('venues', id: id) )
    end

    def artist_by_id(id)
      Artist.by_id(id, @connection)
    end

  end
end
