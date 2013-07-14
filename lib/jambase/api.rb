module Jambase
  class Api
    attr_accessor :connection

    def initialize(api_key)
      @connection = Connection.new(api_key)
    end

    def events_by_zip(zip)
      Event.by_zip(zip, self)
    end

    def events_by_artist_id(artist_id)
      Event.by_artist_id(artist_id, self)
    end

    def events_by_venue_id(venue_id)
      Event.by_venue_id(venue_id, self)
    end

    def event_by_id(event_id)
      Event.by_id(event_id, self)
    end

    def venue_by_id(id)
      Venue.by_id(id, self)
    end

    def artist_by_id(id)
      Artist.by_id(id, self)
    end

  end
end
