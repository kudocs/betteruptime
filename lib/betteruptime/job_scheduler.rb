# frozen_string_literal: true

module Betteruptime
  module JobScheduler
    def self.schedule
      if defined?(Sidekiq)
        Betteruptime.configuration.jobs.each do |c|
          Sidekiq.set_schedule("heartbeat_#{c.name.to_s.downcase}",
            { 
              every: ['5m', first_in: '5m'],
              class: 'Betteruptime::GenericJob',
              args: [c.name, c.block.to_source]
            }
          )
        end
      else
        puts 'Sidekiq is not defined!'
      end
    end
  end
end
