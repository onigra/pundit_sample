require 'spec_helper'

describe UsersHelper do
  describe ".user_show?" do
    context '管理者' do
      include_context "管理者"
      subject { user_show?(user) }
      it { should be_true }
    end

    context '権限保持者' do
      include_context "User"
      subject { user_show?(user) }
      it { should be_true }
    end

    context '権限非保持者' do
      include_context "Role"
      subject { user_show?(user) }
      it { should be_false }
    end
  end

  describe ".user_edit?" do
    context '管理者' do
      include_context "管理者"
      subject { user_edit?(user) }
      it { should be_true }
    end

    context '権限保持者' do
      include_context "User"
      subject { user_edit?(user) }
      it { should be_true }
    end

    context '権限非保持者' do
      include_context "Role"
      subject { user_edit?(user) }
      it { should be_false }
    end
  end

  describe ".user_destroy?" do
    context '管理者' do
      include_context "管理者"
      subject { user_destroy?(user) }
      it { should be_true }
    end

    context '権限保持者' do
      include_context "User"
      subject { user_destroy?(user) }
      it { should be_true }
    end

    context '権限非保持者' do
      include_context "Role"
      subject { user_destroy?(user) }
      it { should be_false }
    end
  end

  describe ".user_create?" do
    context '管理者' do
      include_context "管理者"
      subject { user_create?(user) }
      it { should be_true }
    end

    context '権限保持者' do
      include_context "User"
      subject { user_create?(user) }
      it { should be_true }
    end

    context '権限非保持者' do
      include_context "Role"
      subject { user_create?(user) }
      it { should be_false }
    end
  end
end
