# frozen_string_literal: true

# rubocop:disable Lint/RescueException
module Betteruptime
  # generic job
  class GenericJob < ActiveJob::Base
    def perform(name)
      job = Betteruptime.configuration.jobs.find { |j| j.name.to_s == name.to_s }
      raise "Unknown betteruptime job: #{name}" unless job

      job.block.call
      Api.new(name).ping_heartbeat
    rescue Exception => e
      puts e
    end
  end
end
# rubocop:enable Lint/RescueException
