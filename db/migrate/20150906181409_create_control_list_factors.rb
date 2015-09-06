class CreateControlListFactors < ActiveRecord::Migration
  def change
    create_table :control_list_factors do |t|
      t.integer :order_num
      t.string :factor
      t.boolean :is_active
      t.string :comment

      t.timestamps null: false
    end
  end
end
