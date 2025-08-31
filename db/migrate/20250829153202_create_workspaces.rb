class CreateWorkspaces < ActiveRecord::Migration[8.0]
  def change
    create_table :workspaces do |t|
      t.string :subjests

      t.timestamps
    end
  end
end
