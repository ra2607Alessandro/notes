class RenameSubjestsToSubjects < ActiveRecord::Migration[8.0]
  def change
     rename_column :workspaces, :subjests, :subjects
  end
end
