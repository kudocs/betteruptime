# frozen_string_literal: true

module Betteruptime
  class Job
    attr_accessor :name, :block

    def initialize(name, block)
      @name = name
      @block = block
    end
  end
end
