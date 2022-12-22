# frozen_string_literal: true
require 'sourcify'

module Betteruptime
  class GenericJob < ActiveJob::Base
    def perform(name, block)
      eval(block).call
      
      response = JSON.parse(
        URI.open(Betteruptime::API_HEARTBEAT_URL, Authorization: "Bearer #{Betteruptime.configuration.api_token}").read
      )

      ping_url = response['data'].select { |ht| ht.dig('attributes', 'name') == name }&.first&.dig('attributes', 'url')

      if ping_url
        URI.open(ping_url).read
      else
        raise StandardError.new("heartbeat #{name}: not configured")
      end
    rescue Exception => e
      puts e
    end
  end
end
