# frozen_string_literal: true

require 'betteruptime/version'
require 'betteruptime/configuration'

module Betteruptime
  module_function

  def configure
    yield(configuration)
  end

  def configuration
    @configuration ||= Configuration.new
  end

  def schedule!
    JobScheduler.new.tap(&:check)
  end
end
