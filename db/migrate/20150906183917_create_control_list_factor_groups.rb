class CreateControlListFactorGroups < ActiveRecord::Migration
  def change
    create_table :control_list_factor_groups do |t|
      t.integer :order_num
      t.string :name

      t.timestamps null: false
    end
  end
end
