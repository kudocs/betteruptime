# frozen_string_literal: true

module Betteruptime
  class Api
    HEARTBEAT_URL = 'https://betteruptime.com/api/v2/heartbeats'

    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def ping_heartbeat
      ping_url = heartbeats.select do |heartbeat|
        heartbeat.dig('attributes', 'name') == name
      end&.first&.dig('attributes', 'url')

      ping_url ? URI.open(ping_url).read : nil
    end

    private

    def heartbeats
      JSON.parse(
        URI.open(
          HEARTBEAT_URL,
          'Authorization' => "Bearer #{Betteruptime.configuration.api_token}"
        ).read
      ).try(:[], 'data')
    rescue
      []
    end
  end
end
