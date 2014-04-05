require 'spec_helper'

describe User do
  describe 'relationship' do
    it { should belong_to(:role) }
  end
end
