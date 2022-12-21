# frozen_string_literal: true

module Betteruptime
  class Configuration
    attr_accessor :method, :checks

    def initialize
      clear!
    end

    def add_check(name, block)
      @checks << Check.new(name, block)
    end

    def clear!
      @checks = []
    end
  end
end
