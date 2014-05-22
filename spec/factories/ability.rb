FactoryGirl.define do

  # admin
  factory :admin_ability, class: Ability do
    domain 'admin'
    ability 'admin'
  end

  # user
  factory :user_index, class: Ability do
    domain 'user'
    ability 'index'
  end

  factory :user_show, class: Ability do
    domain 'user'
    ability 'show'
  end

  factory :user_create, class: Ability do
    domain 'user'
    ability 'create'
  end

  factory :user_update, class: Ability do
    domain 'user'
    ability 'update'
  end

  factory :user_destroy, class: Ability do
    domain 'user'
    ability 'destroy'
  end

  # role
  factory :role_index, class: Ability do
    domain 'role'
    ability 'index'
  end

  factory :role_show, class: Ability do
    domain 'role'
    ability 'show'
  end

  factory :role_create, class: Ability do
    domain 'role'
    ability 'create'
  end

  factory :role_update, class: Ability do
    domain 'role'
    ability 'update'
  end

  factory :role_destroy, class: Ability do
    domain 'role'
    ability 'destroy'
  end

  # roleのテスト用の適当なドメインの権限
  factory :foo_index, class: Ability do
    domain 'foo'
    ability 'index'
  end

  factory :foo_show, class: Ability do
    domain 'foo'
    ability 'show'
  end

  factory :foo_create, class: Ability do
    domain 'foo'
    ability 'create'
  end

  factory :foo_update, class: Ability do
    domain 'foo'
    ability 'update'
  end

  factory :foo_destroy, class: Ability do
    domain 'foo'
    ability 'destroy'
  end
end
