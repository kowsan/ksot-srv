class WorkSpaceInactive < ActiveRecord::Migration
  def change
    rename_column :work_spaces,:is_used,:is_active
  end
end
