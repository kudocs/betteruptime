# frozen_string_literal: true

module Betteruptime
  class GenericJob < ActiveJob::Base
    def perform(block)
      block.call
    end
  end
end
