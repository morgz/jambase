module Jambase
  class Artist < InfoHash

    def self.by_id(id, api)
      new( api.connection.get('artists', id: id), api )
    end

    def events
      api.events_by_artist_id(self.id)
    end

  end
end

