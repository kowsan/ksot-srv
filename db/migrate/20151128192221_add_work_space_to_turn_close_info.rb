class AddWorkSpaceToTurnCloseInfo < ActiveRecord::Migration
  def change
    TurnCloseInfo.destroy_all
    change_table :turn_close_infos do |t|
      t.belongs_to :work_space, :foreign_key => true,:index=> true
      t.belongs_to :auto_work_space
    end
  end
end

