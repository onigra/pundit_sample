require 'spec_helper'

describe Role do
  describe 'relationship' do
    it { should have_one(:user) }
  end
end
