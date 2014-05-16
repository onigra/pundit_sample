class RolePolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.admin?
        scope.all
      else
        scope.except_admin
      end
    end
  end

  def index?
    user.admin? or can? "index"
  end

  def show?
    user.admin? or can? "show"
  end

  def create?
    user.admin? or can? "create"
  end

  def new?
    create?
  end

  def update?
    user.admin? or can? "update"
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? or can? "destroy"
  end
end
