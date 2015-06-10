class AddFkStaffRole < ActiveRecord::Migration
  def change
    add_foreign_key :users,:staff_roles
  end
end
