class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role

  def ability(result = {})
    Ability.where(id: self.role.roles_abilities.map(&:ability_id)).group_by(&:domain).each do |domain, abilities|
      result[domain] = abilities.map { |item| item.ability }
    end

    result
  end

  def admin?
    ability.include? 'admin'
  end

  scope :except_admin, -> {
    joins(:role).where.not(roles: { name: "administrator"} )
  }
end
