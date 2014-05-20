class Ability < ActiveRecord::Base
  has_many :roles_abilities
  has_many :roles, through: :roles_abilities

  def self.ability_hash(ability_id, result = {})
    self.group_by_domain(ability_id).each do |domain, abilities|
      result[domain] = abilities.map { |item| item.ability }
    end

    result
  end

  def self.ability_hash_with_id(ability_id, result = {})
    self.group_by_domain(ability_id).each do |domain, abilities|
      result[domain] = abilities.map { |item| { item.ability => item.id } }
    end

    result
  end

  scope :except_admin, -> {
    where.not(abilities: { domain: "admin", ability: "admin" })
  }

  scope :group_by_domain, ->(ability_id) {
    where(id: ability_id).group_by(&:domain)
  }
end
