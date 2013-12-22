require 'spec_helper'

describe 'rails_best_practices' do

  it 'should conform' do
    system('rubocop').should be_true
  end

end
