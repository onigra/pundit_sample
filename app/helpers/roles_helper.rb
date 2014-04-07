module RolesHelper
  def role_show?(user = current_user)
    Pundit.policy(user, Role.new).show?
  end

  def role_edit?(user = current_user)
    Pundit.policy(user, Role.new).edit?
  end

  def role_destroy?(user = current_user)
    Pundit.policy(user, Role.new).destroy?
  end

  def role_create?(user = current_user)
    Pundit.policy(user, Role.new).create?
  end
end
