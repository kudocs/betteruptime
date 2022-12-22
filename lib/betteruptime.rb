# frozen_string_literal: true

require 'betteruptime/configuration'
require 'betteruptime/generic_job'
require 'betteruptime/job'
require 'betteruptime/job_scheduler'
require 'betteruptime/version'

module Betteruptime
  API_HEARTBEAT_URL = 'https://betteruptime.com/api/v2/heartbeats'

  module_function

  def configure
    yield(configuration)
  end

  def configuration
    @configuration ||= Configuration.new
  end

  def schedule!
    JobScheduler.schedule
  end
end
