class ChangeColumnsAddNotnullOnSceneCollections < ActiveRecord::Migration[7.0]
  def change
    change_column :scene_collections, :short_description, :text, null: false
  end
end
