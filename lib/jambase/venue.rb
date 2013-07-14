module Jambase
  class Venue < InfoHash

    def self.by_id(id, api)
      new( api.connection.get('venues', id: id), api )
    end

  end
end
