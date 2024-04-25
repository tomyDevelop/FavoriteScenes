class RenameNacknameColumnToProfiles < ActiveRecord::Migration[7.0]
  def change
    rename_column :profiles, :nackname, :nickname
  end
end
