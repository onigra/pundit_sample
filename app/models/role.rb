class Role < ActiveRecord::Base
  has_one :user
  has_many :roles_abilities, :dependent => :destroy
  has_many :abilities, through: :roles_abilities
  accepts_nested_attributes_for :roles_abilities, :update_only => true
end
