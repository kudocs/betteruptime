# frozen_string_literal: true

# rubocop:disable Style/HashAsLastArrayItem
module Betteruptime
  # job scheduler
  module JobScheduler
    def self.schedule
      return unless defined?(Sidekiq)

      Betteruptime.configuration.jobs.each do |c|
        Sidekiq.set_schedule("heartbeat_#{c.name.to_s.downcase}",
                             {
                               every: ['5m', first_in: '5m'], queue: 'heartbeat',
                               class: 'Betteruptime::GenericJob', args: [c.name, c.block.to_source]
                             })
      end
    end
  end
end
# rubocop:enable Style/HashAsLastArrayItem
