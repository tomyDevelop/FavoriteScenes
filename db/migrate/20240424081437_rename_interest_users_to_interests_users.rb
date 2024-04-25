class RenameInterestUsersToInterestsUsers < ActiveRecord::Migration[7.0]
  def change
    rename_table :interest_users, :interests_users
  end
end
