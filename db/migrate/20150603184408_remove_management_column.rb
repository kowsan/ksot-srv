class RemoveManagementColumn < ActiveRecord::Migration
  def change
    remove_column :areas,:Management
  end
end
