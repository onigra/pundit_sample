require 'spec_helper'

describe Role do

  # role
  let(:user_role) { Fabricate(:user_role) }

  # ability
  let(:foo_index) { Fabricate(:foo_index) }
  let(:foo_show) { Fabricate(:foo_show) }
  let(:foo_create) { Fabricate(:foo_create) }
  let(:foo_udpate) { Fabricate(:foo_udpate) }
  let(:foo_destroy) { Fabricate(:foo_destroy) }

  let(:all_update) do
    {
      "name" => "fuga",
      "roles_abilities_attributes" => [
        { "ability_id" => foo_index.to_param },
        { "ability_id" => foo_show.to_param }
      ]
    }
  end

  let(:not_update) do
    {
      "roles_abilities_attributes" => [
        { "ability_id" => user_role.roles_abilities[0].ability_id },
        { "ability_id" => user_role.roles_abilities[1].ability_id },
        { "ability_id" => user_role.roles_abilities[2].ability_id },
        { "ability_id" => user_role.roles_abilities[3].ability_id },
        { "ability_id" => user_role.roles_abilities[4].ability_id }
      ]
    }
  end

  let(:some_update) do
    {
      "name" => "fuga",
      "roles_abilities_attributes" => [
        { "ability_id" => user_role.roles_abilities[0].ability_id },
        { "ability_id" => user_role.roles_abilities[1].ability_id },
        { "ability_id" => user_role.roles_abilities[2].ability_id },
        { "ability_id" => user_role.roles_abilities[3].ability_id },
        { "ability_id" => foo_index.to_param }
      ]
    }
  end

  let(:not_include_roles_abilities_attributes) do
    {
      "name" => "fuga"
    }
  end

  let(:roles_abilities_attributes_is_empty) do
    {
      "roles_abilities_attributes" => []
    }
  end

  describe 'relationship' do
    it { should have_one(:user) }
    it { should have_many(:roles_abilities).dependent(:destroy) }
    it { should have_many(:abilities).through(:roles_abilities) }
    it { should accept_nested_attributes_for(:roles_abilities).update_only(true) }
  end

  describe "#ability" do
    subject { user_role.ability }
    it { should include "user" }
  end

  describe "#get_destroy_id", "roleに紐づくability_idの更新時に、削除するability_idを取得する" do
    subject { user_role.get_destroy_id(all_update) }
    it { should eq user_role.ability_id_to_a }
  end

  describe "#destroy_old_abilities" do
    let(:old_ability_id) { user_role.roles_abilities.map{|i| i.id } }

    before do
      user_role.destroy_old_abilities(all_update)
      user_role.reload
    end

    it { expect(Role.exists?(old_ability_id[0])).to be_false }
    it { expect(Role.exists?(old_ability_id[1])).to be_false }
  end

  describe "#push_current_roles_abilities_id" do
    context "全更新 全ての要素にidが含まれていない" do
      let(:attributes) { user_role.push_current_roles_abilities_id { all_update } }

      it { expect(attributes["roles_abilities_attributes"][0]).not_to include "id" }
      it { expect(attributes["roles_abilities_attributes"][1]).not_to include "id" }
    end

    context "一部更新 idが含まれている要素がある" do
      let(:attributes) { user_role.push_current_roles_abilities_id { some_update } }

      it { expect(attributes["roles_abilities_attributes"][0]).to include "id" }
      it { expect(attributes["roles_abilities_attributes"][1]).to include "id" }
      it { expect(attributes["roles_abilities_attributes"][2]).to include "id" }
      it { expect(attributes["roles_abilities_attributes"][3]).to include "id" }
      it { expect(attributes["roles_abilities_attributes"][4]).not_to include "id" }
    end

    context "更新なし 全ての要素にidが含まれている" do
      let(:attributes) { user_role.push_current_roles_abilities_id { not_update } }

      it { expect(attributes["roles_abilities_attributes"][0]).to include "id" }
      it { expect(attributes["roles_abilities_attributes"][1]).to include "id" }
    end

    context "roles_abilities_attributes無し" do
      subject { user_role.push_current_roles_abilities_id { not_include_roles_abilities_attributes } }
      it { should eq not_include_roles_abilities_attributes }
    end
  end

  describe "#destroy_and_update" do
    context "roles_abilities_attributesなし" do
      before do
        user_role.destroy_and_update(not_include_roles_abilities_attributes)
        user_role.reload
      end

      it "abilityは残っている" do
        expect(user_role.ability).to include('user')
      end

      it "名前は変わっている" do
        expect(user_role.name).to eq not_include_roles_abilities_attributes["name"]
      end
    end

    context "roles_abilities_attributesに空配列が入っている" do
      before do
        user_role.destroy_and_update(roles_abilities_attributes_is_empty)
        user_role.reload
      end

      it "abilityは更新されない" do
        expect(user_role.ability).to include('user')
      end

      it { expect(user_role.name).to eq "User権限" }
    end

    context "全更新" do
      let(:old_ability_id) { user_role.get_destroy_id(all_update) }

      before do
        user_role.destroy_and_update(all_update)
        user_role.reload
      end

      context "新しく作成したdomainが存在する" do
        subject { user_role.ability }

        it { should include foo_index.domain }
      end

      context "削除したdomainが存在しない" do
        subject { user_role.ability }

        it { should_not include 'user' }
      end

      context "user_roleに紐づくability_idがall_updateと一致している" do
        subject { user_role.ability_id_to_a }

        it { should eq all_update["roles_abilities_attributes"].map {|i| i['ability_id'].to_i } }
      end

      it "物理削除したability_idが存在しない1" do
        expect(Role.exists?(old_ability_id[0])).to be_false
      end

      it "物理削除したability_idが存在しない2" do
        expect(Role.exists?(old_ability_id[1])).to be_false
      end

    end

    context "更新なし" do
      before do
        user_role.destroy_and_update(not_update)
        user_role.reload
      end

      context "user_roleに紐づくability_idがnot_updateと一致している" do
        subject { user_role.ability_id_to_a }

        it { should eq not_update["roles_abilities_attributes"].map {|i| i['ability_id'].to_i } }
      end
    end

    context "一部更新" do
      let(:old_ability_id) { user_role.get_destroy_id(some_update) }

      before do
        user_role.destroy_and_update(some_update)
        user_role.reload
      end

      context "新しく作成したdomainが存在する" do
        subject { user_role.ability }

        it { should include foo_index.domain }
      end

      context "user_roleに紐づくability_idがsome_updateと一致している" do
        subject { user_role.ability_id_to_a }

        it { should eq some_update["roles_abilities_attributes"].map {|i| i['ability_id'].to_i } }
      end

      context "物理削除したability_idが存在しない" do
        subject { Role.exists?(old_ability_id[0]) }

        it { should be_false }
      end
    end

    context "ロールバック" do
      context "古いレコードの削除が失敗した場合" do
        before do
          Role.any_instance.stub(:destroy_old_abilities).and_raise
          user_role.destroy_and_update(all_update)
          user_role.reload
        end

        it { expect(user_role.ability).to include('user') }
      end

      context "新しいレコードの作成が失敗した場合" do
        before do
          Role.any_instance.stub(:update).and_return(false)
          user_role.destroy_and_update(all_update)
          user_role.reload
        end

        it { expect(user_role.ability).to include('user') }
      end
    end
  end
end
