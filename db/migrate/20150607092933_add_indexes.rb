class AddIndexes < ActiveRecord::Migration
  def change
    add_index :users,:staff_role_id
    add_index :users,:is_active
    add_index :users,:subdivision_id
  end
end
