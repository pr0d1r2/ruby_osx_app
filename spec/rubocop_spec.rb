# frozen_string_literal: true

require 'spec_helper'

describe 'RuboCop' do
  it 'should conform' do
    expect(system('rubocop')).to be true
  end
end
