require 'active_support/inflector'

module Jambase
  class InfoHash
    attr_accessor :attrs

    def initialize(attrs, api)
      @attrs=attrs
      @api=api
    end

    def respond_to?(attr_name)
      return true if @attrs[attr_name.to_s.classify]
      super
    end

    def method_missing(attr_name, *opts)
      @attrs.fetch(attr_name.to_s.classify){ super }
    end

    def ==(other)
      self.attrs == other.attrs
    end

  end
end
