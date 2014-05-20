class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role

  validates_presence_of :name, :email
  validates_confirmation_of :password

  def ability
    Ability.ability_hash self.role.roles_abilities.map(&:ability_id)
  end

  def admin?
    ability.include? 'admin'
  end

  scope :except_admin, -> {
    joins(:role).where.not(roles: { name: "administrator"} )
  }
end
