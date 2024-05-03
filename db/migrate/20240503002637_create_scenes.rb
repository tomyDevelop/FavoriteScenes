class CreateScenes < ActiveRecord::Migration[7.0]
  def change
    create_table :scenes do |t|
      t.integer :seconds, null: false
      t.text :highlight
      t.references :scene_collection

      t.timestamps
    end
  end
end
