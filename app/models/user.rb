class User < ActiveRecord::Base
  belongs_to :role

  def ability(h = {})
    role.roles_abilities.group_by {|i| i.ability.domain }.each do |key, vals|
      h[key] = vals.map {|val| val.ability.ability }
    end

    return h
  end
end
