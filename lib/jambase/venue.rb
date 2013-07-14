module Jambase
  class Venue < InfoHash

    def events
      api.events_by_venue_id(self.id)
    end

  end
end
