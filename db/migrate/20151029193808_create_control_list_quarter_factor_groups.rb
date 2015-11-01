class CreateControlListQuarterFactorGroups < ActiveRecord::Migration
  def change
    create_table :control_list_quarter_factor_groups do |t|
      t.integer :order_num
      t.string :name

      t.timestamps null: false
    end
    
    
    change_table :control_list_quarter_factors do |t|
      t.belongs_to :control_list_quarter_factor_group
    end
#    add_foreign_key :control_list_quarter_factors,:control_list_quarter_factor_group
  end
end
