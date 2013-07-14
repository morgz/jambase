require 'active_support/inflector'

module Jambase
  class InfoHash

    def initialize(attrs)
      @attrs=attrs
    end

    def respond_to?(attr_name)
      return true if @attrs[attr_name.to_s.classify]
      super
    end

    def method_missing(attr_name, *opts)
      @attrs.fetch(attr_name.to_s.classify){ super }
    end

  end
end
