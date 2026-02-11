# frozen_string_literal: true

require File.expand_path('../spec_helper', __dir__)
require File.expand_path('../../lib/betteruptime', __dir__)

module Sidekiq
  def self.set_schedule(name, config); end
end

RSpec.describe Betteruptime::JobScheduler do
  before do
    Betteruptime.configuration.clear!
  end

  it 'schedules jobs with only the name as args' do
    Betteruptime.configure do |config|
      config.add_job :test_job, -> { 'hello' }
    end

    expect(Sidekiq).to receive(:set_schedule).with(
      'heartbeat_test_job',
      hash_including(args: [:test_job])
    )

    Betteruptime::JobScheduler.schedule
  end

  it 'schedules multiple jobs' do
    Betteruptime.configure do |config|
      config.add_job :job_one, -> { 'one' }
      config.add_job :job_two, -> { 'two' }
    end

    expect(Sidekiq).to receive(:set_schedule).twice

    Betteruptime::JobScheduler.schedule
  end
end
