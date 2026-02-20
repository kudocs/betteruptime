# frozen_string_literal: true

require 'open-uri'

module Betteruptime
  # api connection
  class Api
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def ping_heartbeat
      ping_url = heartbeats.select do |heartbeat|
        heartbeat.dig('attributes', 'name') == name
      end&.first&.dig('attributes', 'url')

      ping_url ? URI.parse(ping_url).read : nil
    end

    private

    def heartbeats
      JSON.parse(
        URI.open(
          'https://betteruptime.com/api/v2/heartbeats',
          'Authorization' => "Bearer #{Betteruptime.configuration.api_token}"
        ).read
      ).try(:[], 'data')
    rescue JSON::ParserError, SocketError, OpenURI::HTTPError
      []
    end
  end
end
