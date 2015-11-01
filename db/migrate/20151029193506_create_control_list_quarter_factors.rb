class CreateControlListQuarterFactors < ActiveRecord::Migration
  def change
    create_table :control_list_quarter_factors do |t|
      t.integer :order_num
      t.string :factor
      t.boolean :is_active
      t.string :comment

      t.timestamps null: false
    end
  end
end
