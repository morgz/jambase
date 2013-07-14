module Jambase
  class Events
    def self.by_zip(zipcode, api)
      data = api.connection.get('events', zipCode:zipcode)
      data['Events'].map{|event| Event.new(event) }
    end
  end
end
