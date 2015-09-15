class CreateControlListMonths < ActiveRecord::Migration
  def change
    create_table :control_list_months do |t|
      t.date :form_date
      t.belongs_to :author,:class_name=> User
      t.belongs_to :subdivision

      t.timestamps null: false
    end
  end
end
