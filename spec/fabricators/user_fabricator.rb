Fabricator :administrator, class_name: User do
  name { "#{Forgery(:internet).user_name}#{Fabricate.sequence}" }
  role_id { Fabricate(:admin_role).id }
  email    { Forgery(:email).address }
  password { Forgery(:basic).password(:at_least => 9, :at_most => 10) }
end

Fabricator :has_user_authority, class_name: User do
  name { "#{Forgery(:internet).user_name}#{Fabricate.sequence}" }
  role_id { Fabricate(:user_role).id }
  email    { Forgery(:email).address }
  password { Forgery(:basic).password(:at_least => 9, :at_most => 10) }
end

Fabricator :has_role_authority, class_name: User do
  name { "#{Forgery(:internet).user_name}#{Fabricate.sequence}" }
  role_id { Fabricate(:role_role).id }
  email    { Forgery(:email).address }
  password { Forgery(:basic).password(:at_least => 9, :at_most => 10) }
end
