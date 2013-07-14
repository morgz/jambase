module Jambase
  class Api
    attr_accessor :connection

    def initialize(api_key)
      @connection = Connection.new(api_key)
    end

    def events_by_zip(zip)
      Event.by_zip(zip, self)
    end

    def venue_by_id(id)
      Venue.by_id(id, self)
    end

    def artist_by_id(id)
      Artist.by_id(id, self)
    end

  end
end
