require 'spec_helper'

describe Role do
  describe 'relationship' do
    it { should have_one(:user) }
    it { should have_many(:roles_abilities).dependent(:destroy) }
    it { should have_many(:abilities).through(:roles_abilities) }
    it { should accept_nested_attributes_for(:roles_abilities).update_only(true) }
  end
end
