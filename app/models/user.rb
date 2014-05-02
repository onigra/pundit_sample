class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role

  def ability(h = {})
    role.roles_abilities.group_by {|i| i.ability.domain }.each do |key, vals|
      h[key] = vals.map {|val| val.ability.ability }
    end

    return h
  end

  def admin?
    ability.include? 'admin'
  end

  scope :except_admin, -> {
    joins(:role).where.not(roles: { name: "administrator"} )
  }
end
