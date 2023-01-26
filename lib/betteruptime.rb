# frozen_string_literal: true

require 'betteruptime/configuration'

require 'betteruptime/api'
require 'betteruptime/generic_job'
require 'betteruptime/job'
require 'betteruptime/job_scheduler'
require 'betteruptime/version'

# betteruptime helper
module Betteruptime
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
