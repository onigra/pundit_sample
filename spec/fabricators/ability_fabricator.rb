# administrator
Fabricator :admin_ability, class_name: Ability do
  domain 'admin'
  ability 'admin'
end

# user
Fabricator :user_index, class_name: Ability do
  domain 'user'
  ability 'index'
end

Fabricator :user_show, class_name: Ability do
  domain 'user'
  ability 'show'
end

Fabricator :user_create, class_name: Ability do
  domain 'user'
  ability 'create'
end

Fabricator :user_update, class_name: Ability do
  domain 'user'
  ability 'update'
end

Fabricator :user_destroy, class_name: Ability do
  domain 'user'
  ability 'destroy'
end

# role
Fabricator :role_index, class_name: Ability do
  domain 'role'
  ability 'index'
end

Fabricator :role_show, class_name: Ability do
  domain 'role'
  ability 'show'
end

Fabricator :role_create, class_name: Ability do
  domain 'role'
  ability 'create'
end

Fabricator :role_update, class_name: Ability do
  domain 'role'
  ability 'update'
end

Fabricator :role_destroy, class_name: Ability do
  domain 'role'
  ability 'destroy'
end
