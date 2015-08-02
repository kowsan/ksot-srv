class CreateExclusionDays < ActiveRecord::Migration
  def change
    create_table :exclusion_days do |t|
      t.date :day
      t.references :turn_type,:index=>true
      t.timestamps null: false
    end
  end
end
