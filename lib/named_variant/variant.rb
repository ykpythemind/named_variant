module NamedVariant
  class Variant
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def to_h
      options
    end
  end
end
