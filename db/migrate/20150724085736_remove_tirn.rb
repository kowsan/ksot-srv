class RemoveTirn < ActiveRecord::Migration
  def change
    drop_table :turn_types
    drop_table :turn_dates
    drop_table :turns
  end
end
