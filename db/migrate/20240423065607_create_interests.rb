class CreateInterests < ActiveRecord::Migration[7.0]
  def change
    create_table :interests do |t|
      t.string :interest, null: false, index: { unique: true }
      t.integer :sort_key

      t.timestamps
    end
  end
end
