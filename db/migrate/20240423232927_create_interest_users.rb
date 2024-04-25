class CreateInterestUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :interest_users, id: false do |t|
      t.references :user
      t.references :interest
    end
  end
end
