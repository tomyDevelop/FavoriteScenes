class DropInterestProfiles < ActiveRecord::Migration[7.0]
  def change
    drop_table :interest_profiles
  end
end
