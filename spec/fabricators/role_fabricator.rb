Fabricator :admin_role, class_name: Role do
  name 'administrator'

  after_create do |r|
    Fabricate(:roles_ability, :role_id => r.id, :ability_id => Fabricate(:admin_ability).id)
  end
end

Fabricator :user_role, class_name: Role do
  name 'User権限'

  after_create do |r|
    Fabricate(:roles_ability, :role_id => r.id, :ability_id => Fabricate(:user_index).id)
    Fabricate(:roles_ability, :role_id => r.id, :ability_id => Fabricate(:user_show).id)
    Fabricate(:roles_ability, :role_id => r.id, :ability_id => Fabricate(:user_create).id)
    Fabricate(:roles_ability, :role_id => r.id, :ability_id => Fabricate(:user_update).id)
    Fabricate(:roles_ability, :role_id => r.id, :ability_id => Fabricate(:user_destroy).id)
  end
end

Fabricator :role_role, class_name: Role do
  name 'Role権限'

  after_create do |r|
    Fabricate(:roles_ability, :role_id => r.id, :ability_id => Fabricate(:role_index).id)
    Fabricate(:roles_ability, :role_id => r.id, :ability_id => Fabricate(:role_show).id)
    Fabricate(:roles_ability, :role_id => r.id, :ability_id => Fabricate(:role_create).id)
    Fabricate(:roles_ability, :role_id => r.id, :ability_id => Fabricate(:role_update).id)
    Fabricate(:roles_ability, :role_id => r.id, :ability_id => Fabricate(:role_destroy).id)
  end
end
