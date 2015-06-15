class RemoveAwsFromWorkSpace < ActiveRecord::Migration
  def change
    remove_column :work_spaces, :auto_work_space_id
    change_table :auto_work_spaces do |t|
      t.belongs_to :work_space
    end
  end
end
