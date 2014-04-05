class Role < ActiveRecord::Base
  has_one :user
end
