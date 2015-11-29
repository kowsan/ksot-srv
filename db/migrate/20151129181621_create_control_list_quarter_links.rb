class CreateControlListQuarterLinks < ActiveRecord::Migration
  def change
    create_table :control_list_quarter_links do |t|


      t.belongs_to :control_list_quarter
      t.belongs_to :control_list_quarter_factor_group
      t.belongs_to :control_list_quarter_factor
      t.string :inconsistency
      t.string :note_due
      t.string :note_measures
      t.belongs_to :status
      t.date :date_due

    end
  end
end
