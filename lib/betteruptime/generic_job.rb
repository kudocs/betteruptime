# frozen_string_literal: true

require 'sourcify'

# rubocop:disable Security/Eval, Lint/RescueException
module Betteruptime
  # generic job
  class GenericJob < ActiveJob::Base
    def perform(name, block)
      eval(block).call

      Api.new(name).ping_heartbeat
    rescue Exception => e
      puts e
    end
  end
end
# rubocop:enable Security/Eval, Lint/RescueException
