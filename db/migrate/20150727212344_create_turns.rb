class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.date :day_date
      t.time :first_time
      t.integer :first_duration
      t.time :second_time
      t.integer :second_duration
      t.boolean :is_dayoff, :default => false

      t.timestamps null: false
    end
  end
end
