class TransferAutoWorkSpaces < ActiveRecord::Migration
  def change
    create_join_table :auto_work_spaces, :work_spaces, id: false


    AutoWorkSpace.all.each do |aw|
      aw.work_spaces << aw.work_space
    end
  end
end
