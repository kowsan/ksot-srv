class ChangeTurn < ActiveRecord::Migration
  def change

    change_table  :turns do |t|
      t.remove  :first_time
      t.remove :first_duration
      t.remove :second_time
      t.remove :second_duration
      t.remove :is_dayoff
      t.references :turn_type
    end
  end
end
