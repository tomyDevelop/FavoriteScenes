class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :account_name, null: false, index: { unique: true }
      t.string :email
      t.string :nickname, null: false
      t.string :crypted_password
      t.string :salt

      t.timestamps                null: false
    end
  end
end
