Fabricator :administrator, class_name: User do
  name { "#{Forgery(:internet).user_name}#{Fabricate.sequence}" }
  role_id { Fabricate(:admin_role).id }
end

Fabricator :has_user_authority, class_name: User do
  name { "#{Forgery(:internet).user_name}#{Fabricate.sequence}" }
  role_id { Fabricate(:user_role).id }
end

Fabricator :has_role_authority, class_name: User do
  name { "#{Forgery(:internet).user_name}#{Fabricate.sequence}" }
  role_id { Fabricate(:role_role).id }
end
