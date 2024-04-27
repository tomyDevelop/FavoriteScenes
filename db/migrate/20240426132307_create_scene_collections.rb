class CreateSceneCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :scene_collections do |t|
      t.string :video_id, null: false
      t.string :video_title
      t.string :channel_name
      t.string :title, null: false
      t.text :short_description
      t.references :category
      t.references :user

      t.timestamps
    end
  end
end
