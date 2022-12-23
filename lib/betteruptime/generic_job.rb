# frozen_string_literal: true
require 'sourcify'

module Betteruptime
  class GenericJob < ActiveJob::Base
    def perform(name, block)
      eval(block).call

      Api.new(name).ping_heartbeat
    rescue Exception => e
      puts e
    end
  end
end
