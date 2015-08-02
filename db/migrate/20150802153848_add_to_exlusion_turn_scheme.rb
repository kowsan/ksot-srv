class AddToExlusionTurnScheme < ActiveRecord::Migration
  def change
    change_table :exclusion_days do |t|
      t.references :turn_scheme,:index=>true
    end
  end
end
