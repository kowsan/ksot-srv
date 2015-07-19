class RemoveOldWorkSpaceId < ActiveRecord::Migration
  def change
    remove_column :auto_work_spaces,:work_space_id
  end
end
