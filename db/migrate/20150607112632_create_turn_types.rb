class CreateTurnTypes < ActiveRecord::Migration
  def change
    create_table :turn_types do |t|
      t.string :name
      t.time :start_time
      t.integer :hour_duration

      #t.datetime :actual_from


      t.timestamps null: false
    end
  end
end
