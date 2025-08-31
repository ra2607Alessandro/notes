class FixSubjectsColumnName < ActiveRecord::Migration[8.0]
  def change
    rename_column :workspaces, :subjects, :notes
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
