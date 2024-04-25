class CreateInterestProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :interest_profiles, id: false do |t|
      t.references :interest
      t.references :profile
    end
  end
end
