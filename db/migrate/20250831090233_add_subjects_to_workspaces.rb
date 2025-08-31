class AddSubjectsToWorkspaces < ActiveRecord::Migration[8.0]
  def change
    add_column :workspaces, :subjects, :string
  end
end
