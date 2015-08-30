class AddUniqueExclusionDay < ActiveRecord::Migration
  def change
    add_index :exclusion_days,[:day,:turn_scheme_id,:turn_type_id], unique: true
  end
end
