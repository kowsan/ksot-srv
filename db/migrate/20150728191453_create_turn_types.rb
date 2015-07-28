class CreateTurnTypes < ActiveRecord::Migration
  def change
    create_table :turn_types do |t|
      t.string :name
      t.time :first_start_at
      t.time :first_duration
      t.time :second_start_at
      t.time :second_duration
      t.integer :reminder_before_end
      t.boolean :is_day_off

      t.timestamps null: false
    end
  end
end
