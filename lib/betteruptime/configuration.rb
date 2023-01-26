# frozen_string_literal: true

module Betteruptime
  # configuration class
  class Configuration
    attr_accessor :method, :jobs, :api_token

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
