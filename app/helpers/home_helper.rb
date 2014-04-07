module HomeHelper
  def user_index?(user = current_user)
    Pundit.policy(user, User.new).index?
  end

  def role_index?(user = current_user)
    Pundit.policy(user, Role.new).index?
  end
end
