class RemoveEmploye < ActiveRecord::Migration
  def up

    drop_table :employees
  end
end
