require 'spec_helper'

describe RolesController do
  let(:only_view_role) { Fabricate(:only_view_role) }


  let(:valid_attributes) do
    {
      "name" => ''
    }
  end

  let(:update_attributes) do
    {
      "name" => "update_name"
    }
  end

  #
  # index
  #
  describe 'GET /roles', '#index' do
    context '管理者' do
      include_context "管理者でログイン"
      it_behaves_like "Role indexができる"
    end

    context '権限保持者' do
      include_context "Role権限保持者でログイン"
      it_behaves_like "Role indexができる"
    end

    context '権限非保持者' do
      include_context "User権限保持者でログイン"
      it_behaves_like "Role indexができない"
    end
  end

  #
  # show
  #
  describe 'GET /roles/:id', '#show' do
    context '管理者' do
      include_context "管理者でログイン"
      it_behaves_like "Role showができる"
    end

    context '権限保持者' do
      include_context "Role権限保持者でログイン"
      it_behaves_like "Role showができる"
    end

    context '権限非保持者' do
      include_context "User権限保持者でログイン"
      it_behaves_like "Role showができない"
    end
  end

=begin
  #
  # new
  #
  describe 'GET /roles/new', '#new' do
    context '管理者' do
      include_context "管理者でログイン"
      it_behaves_like "Role newができる"
    end

    context '権限保持者' do
      include_context "Role権限保持者でログイン"
      it_behaves_like "Role newができる"
    end

    context '権限非保持者' do
      include_context "User権限保持者でログイン"
      it_behaves_like "Role newができない"
    end
  end

  #
  # edit
  #
  describe 'GET /roles/:id/edit', '#edit' do
    context '管理者' do
      include_context "管理者でログイン"
      it_behaves_like "Role editができる"
    end

    context '権限保持者' do
      include_context "Role権限保持者でログイン"
      it_behaves_like "Role editができる"
    end

    context '権限非保持者' do
      include_context "User権限保持者でログイン"
      it_behaves_like "Role editができない"
    end
  end

  #
  # create
  #
  describe 'POST /roles', '#create' do
    context '管理者' do
      include_context "管理者でログイン"
      it_behaves_like "Role createができる"
    end

    context '権限保持者' do
      include_context "Role権限保持者でログイン"
      it_behaves_like "Role createができる"
    end

    context '権限非保持者' do
      include_context "User権限保持者でログイン"
      it_behaves_like "Role createができない"
    end
  end

  #
  # update
  #
  describe 'PATCH/PUT /roles/:id', '#update' do
    context '管理者' do
      include_context "管理者でログイン"
      it_behaves_like "Role updateができる"
    end

    context '権限保持者' do
      include_context "Role権限保持者でログイン"
      it_behaves_like "Role updateができる"
    end

    context '権限非保持者' do
      include_context "User権限保持者でログイン"
      it_behaves_like "Role updateができない"
    end
  end

  #
  # destroy
  #
  describe 'DELETE /roles/:id', '#destroy' do
    context '管理者' do
      include_context "管理者でログイン"
      it_behaves_like "Role destroyができる"
    end

    context '権限保持者' do
      include_context "Role権限保持者でログイン"
      it_behaves_like "Role destroyができる"
    end

    context '権限非保持者' do
      include_context "User権限保持者でログイン"
      it_behaves_like "Role destroyができない"
    end
  end
=end
end
