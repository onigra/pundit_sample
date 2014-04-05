class RolesAbility < ActiveRecord::Base
  belongs_to :role
  belongs_to :ability
end
