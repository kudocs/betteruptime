# frozen_string_literal: true

module Betteruptime
  class JobScheduler
    def initialize; end

    def schedule
      if defined?(Sidekiq)
        Betteruptime.configuration.jobs.each do |c|
          Sidekiq.set_schedule(c.name.to_s.downcase, 
            { 
              cron: '0 */5 * * * *',
              class: 'Betteruptime::GenericJob',
              args: c.block
            }
          )
        end
      else
        puts 'Sidekiq is not defined!'
      end
    end
  end
end
