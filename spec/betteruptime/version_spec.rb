# frozen_string_literal: true

require File.expand_path('../spec_helper', __dir__)
require File.expand_path('../../lib/betteruptime', __dir__)

describe Betteruptime::VERSION do
  it 'should be a string' do
    expect(Betteruptime::VERSION).to be_a String
  end
end
