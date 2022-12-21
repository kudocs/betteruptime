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

  def check
    Checker.new.tap(&:check)
  end

  def custom!(controller)
    configuration.custom.call(controller, check)
  end

  def custom?
    configuration.custom
  end
end
