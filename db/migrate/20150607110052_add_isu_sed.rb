class AddIsuSed < ActiveRecord::Migration
  def change
    add_index :work_spaces,:auto_work_space_id
    add_index :work_spaces,:subdivision_id
    change_column_default :work_spaces,:is_used, true
  end
end
