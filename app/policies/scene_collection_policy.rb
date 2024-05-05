class SceneCollectionPolicy < ApplicationPolicy
  def create?
    user.id === record.user_id
  end

  def update?
    user.id === record.user_id
  end

  def destroy?
    user.id === record.user_id
  end
end
