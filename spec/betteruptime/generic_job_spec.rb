# frozen_string_literal: true

require File.expand_path('../spec_helper', __dir__)
require File.expand_path('../../lib/betteruptime', __dir__)

RSpec.describe Betteruptime::GenericJob do
  let(:api) { instance_double(Betteruptime::Api, ping_heartbeat: true) }

  before do
    allow(Betteruptime::Api).to receive(:new).and_return(api)
    Betteruptime.configuration.clear!
    Betteruptime.configure do |config|
      config.add_job :test_job, -> { 'executed' }
    end
  end

  it 'looks up the job by name and calls its block' do
    job = Betteruptime.configuration.jobs.find { |j| j.name.to_s == 'test_job' }
    expect(job.block).to receive(:call).and_call_original

    described_class.new.perform('test_job')
  end

  it 'pings the heartbeat after execution' do
    expect(api).to receive(:ping_heartbeat)

    described_class.new.perform('test_job')
  end

  it 'raises for unknown job names' do
    expect { described_class.new.perform('nonexistent') }.to output(/Unknown betteruptime job: nonexistent/).to_stdout
  end
end
