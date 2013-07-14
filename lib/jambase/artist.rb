module Jambase
  class Artist < InfoHash

    def self.by_id(id, connection)
      new( connection.get('artists', id: id) )
    end

  end
end
