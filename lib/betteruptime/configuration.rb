# frozen_string_literal: true

module Betteruptime
  class Configuration
    attr_accessor :method, :jobs

    def initialize
      clear!
    end

    def add_job(name, block)
      @jobs << Job.new(name, block)
    end

    def clear!
      @jobs = []
    end
  end
end
