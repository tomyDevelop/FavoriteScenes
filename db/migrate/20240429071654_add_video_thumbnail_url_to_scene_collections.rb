class AddVideoThumbnailUrlToSceneCollections < ActiveRecord::Migration[7.0]
  def change
    add_column :scene_collections, :video_thumbnail_url, :string
  end
end
