class RemoveTitleFromSceneCollections < ActiveRecord::Migration[7.0]
  def change
    remove_column :scene_collections, :title
  end
end
