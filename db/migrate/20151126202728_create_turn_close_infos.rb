class CreateTurnCloseInfos < ActiveRecord::Migration
  def change
    create_table :turn_close_infos do |t|
      t.belongs_to :closed_by,:class_name=> User
      t.belongs_to :turn_type
      t.date :close_date


      t.timestamps null: false
    end
  end
end
