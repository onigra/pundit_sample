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

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    clean_up_passwords
    update(params, *options)
  end
end
