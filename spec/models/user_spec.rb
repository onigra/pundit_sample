require 'spec_helper'

describe User do
  let(:administrator) { Fabricate(:administrator) }
  let(:has_user_authority) { Fabricate(:has_user_authority) }
  let(:has_role_authority) { Fabricate(:has_role_authority) }

  describe 'relationship' do
    it { should belong_to(:role) }
  end

  describe '#ability' do
    context "administrator" do
      subject { administrator.ability }

      it { should include 'admin' }
      its(['admin']) { should include 'admin' }
    end

    context "has_user_authority" do
      subject { has_user_authority.ability }

      it { should include 'user' }
      its(['user']) { should include('index', 'show', 'create', 'update', 'destroy') }
    end

    context "has_role_authority" do
      subject { has_role_authority.ability }

      it { should include 'role' }
      its(['role']) { should include('index', 'show', 'create', 'update', 'destroy') }
    end
  end
end
