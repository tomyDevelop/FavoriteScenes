class ScenePolicy < ApplicationPolicy
  def create?
    user.id === record.scene_collection.user_id
  end

  def update?
    user.id === record.scene_collection.user_id
  end

  def destroy?
    user.id === record.scene_collection.user_id
  end
end
