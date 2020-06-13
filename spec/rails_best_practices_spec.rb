# frozen_string_literal: true

require 'spec_helper'

describe 'rails_best_practices' do
  it 'should conform' do
    expect(system('rails_best_practices --spec')).to be true
  end
end
