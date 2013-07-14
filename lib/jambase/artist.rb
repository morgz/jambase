module Jambase
  class Artist < InfoHash

    def self.by_id(id, api)
      new( api.connection.get('artists', id: id), api )
    end

    def events
      []
    end

  end
end

