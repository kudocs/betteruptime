# frozen_string_literal: true

module Betteruptime
  # job
  class Job
    attr_accessor :name, :block

    def initialize(name, block)
      @name = name
      @block = block
    end
  end
end
