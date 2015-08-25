class CreateExclusionDays < ActiveRecord::Migration
  def change
    drop_table :exclusion_days if table_exists?(:exclusion_days)
    create_table :exclusion_days do |t|
      t.date :day
      t.belongs_to :turn_type
      t.belongs_to :turn_scheme
      t.timestamps null: false
    end
  end
end
