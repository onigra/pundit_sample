FactoryGirl.define do
  factory :administrator, class: User do
    name     { "#{Forgery(:internet).user_name}#{create.sequence}" }
    role_id  { create(:admin_role).id }
    email    { Forgery(:email).address }
    password { Forgery(:basic).password(:at_least => 9, :at_most => 10) }
  end
  
  factory :has_user_authority, class: User do
    name     { "#{Forgery(:internet).user_name}#{create.sequence}" }
    role_id  { create(:user_role).id }
    email    { Forgery(:email).address }
    password { Forgery(:basic).password(:at_least => 9, :at_most => 10) }
  end
  
  factory :has_role_authority, class: User do
    name     { "#{Forgery(:internet).user_name}#{create.sequence}" }
    role_id  { create(:role_role).id }
    email    { Forgery(:email).address }
    password { Forgery(:basic).password(:at_least => 9, :at_most => 10) }
  end
  
  factory :has_only_view_authority, class: User do
    name     { "#{Forgery(:internet).user_name}#{create.sequence}" }
    role_id  { create(:only_view_role).id }
    email    { Forgery(:email).address }
    password { Forgery(:basic).password(:at_least => 9, :at_most => 10) }
  end
end
