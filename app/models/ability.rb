class Ability < ActiveRecord::Base
  has_many :roles_abilities
  has_many :roles, through: :roles_abilities

  scope :except_admin, -> {
    where.not(abilities: { domain: "admin", ability: "admin" })
  }
end
