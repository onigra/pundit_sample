FactoryGirl.define do
  factory :admin_role, class: Role do
    name 'administrator'

    after(:create) do |role|
      create(:roles_ability, role_id: role.id, ability_id: create(:admin_ability).id)
    end

    to_create do |instance|
      instance.save validate: false
    end 
  end

  factory :user_role, class: Role do
    name 'User権限'

    after(:create) do |role|
      create(:roles_ability, role_id: role.id, ability_id: create(:user_index).id)
      create(:roles_ability, role_id: role.id, ability_id: create(:user_show).id)
      create(:roles_ability, role_id: role.id, ability_id: create(:user_create).id)
      create(:roles_ability, role_id: role.id, ability_id: create(:user_update).id)
      create(:roles_ability, role_id: role.id, ability_id: create(:user_destroy).id)
    end

    to_create do |instance|
      instance.save validate: false
    end 
  end

  factory :role_role, class: Role do
    name 'Role権限'

    after(:create) do |role|
      create(:roles_ability, role_id: role.id, ability_id: create(:role_index).id)
      create(:roles_ability, role_id: role.id, ability_id: create(:role_show).id)
      create(:roles_ability, role_id: role.id, ability_id: create(:role_create).id)
      create(:roles_ability, role_id: role.id, ability_id: create(:role_update).id)
      create(:roles_ability, role_id: role.id, ability_id: create(:role_destroy).id)
    end

    to_create do |instance|
      instance.save validate: false
    end 
  end

  factory :only_view_role, class: Role do
    name '参照権限'

    after(:create) do |role|
      create(:roles_ability, role_id: role.id, ability_id: create(:user_index).id)
      create(:roles_ability, role_id: role.id, ability_id: create(:user_show).id)
      create(:roles_ability, role_id: role.id, ability_id: create(:role_index).id)
      create(:roles_ability, role_id: role.id, ability_id: create(:role_show).id)
    end

    to_create do |instance|
      instance.save validate: false
    end 
  end
end
