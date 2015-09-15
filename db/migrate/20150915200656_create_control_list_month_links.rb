class CreateControlListMonthLinks < ActiveRecord::Migration
  def change
    create_table :control_list_month_links do |t|

      t.belongs_to :control_list_month
      t.belongs_to :control_list_factor_group
      t.belongs_to :control_list_factor
      t.belongs_to :user
      t.string :inconsistency
      t.string :note_due
      t.string :note_measures
      t.belongs_to :status
      t.timestamps null: false
    end
  end
end
