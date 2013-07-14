require 'jambase/venue'
require 'jambase/artist'
module Jambase
  class Event < InfoHash

    def self.find_by(api, conditions)
      data = api.connection.get('events', conditions)
      data['Events'].map{|event| new(event, api) }
    end

    def venue
      @venue ||= Venue.new(@attrs['Venue'], api)
    end

    def artists
      @artists ||= @attrs['Artists'].map{|a| Artist.new(a,api) }
    end

    def date
      @date ||= Time.parse(@attrs['Date'])
    end

  end
end
