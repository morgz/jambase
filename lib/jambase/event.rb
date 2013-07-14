require 'jambase/venue'
require 'jambase/artist'
module Jambase
  class Event < InfoHash

    def venue
      @venue ||= Venue.new(@attrs['Venue'])
    end

    def artists
      @artists ||= @attrs['Artists'].map{|a| Artist.new(a) }
    end

    def date
      @date ||= Time.parse(@attrs['Date'])
    end

  end
end
