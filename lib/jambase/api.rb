module Jambase
  class Api
    attr_accessor :connection

    def initialize(api_key)
      @connection = Connection.new(api_key)
    end

    def events_by_zip(zip)
      Event.find_by(self, zipCode: zip)
    end

    def events_by_artist_id(artist_id)
      Event.find_by(self, artistId: artist_id)
    end

    def events_by_venue_id(venue_id)
      Event.find_by(self, venueId: venue_id)
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
