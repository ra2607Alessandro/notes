class CleanupWorkspacesTable < ActiveRecord::Migration[8.0]
  def change
     if column_exists?(:workspaces, :subjests)
      remove_column :workspaces, :subjests
    end
    
    # Ensure subjects column exists and is properly set up
    unless column_exists?(:workspaces, :subjects)
      add_column :workspaces, :subjects, :string
    end
  end
end
