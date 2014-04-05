require 'spec_helper'

describe UsersController do
  let(:valid_attributes) { { "name" => "MyString" } }

  #
  # index
  #
  describe 'GET /users', '#index' do
    context '管理者' do
      include_context "管理者でログイン"
      it_behaves_like "User indexができる"
    end

    context '権限保持者' do
      include_context "User権限保持者でログイン"
      it_behaves_like "User indexができる"
    end

    context '権限非保持者' do
      include_context "Role権限保持者でログイン"
      it_behaves_like "User indexができない"
    end
  end

  #
  # show
  #
  describe 'GET /users/:id', '#show' do
    context '管理者' do
      include_context "管理者でログイン"
      it_behaves_like "User showができる"
    end

    context '権限保持者' do
      include_context "User権限保持者でログイン"
      it_behaves_like "User showができる"
    end

    context '権限非保持者' do
      include_context "Role権限保持者でログイン"
      it_behaves_like "User showができない"
    end
  end
end
