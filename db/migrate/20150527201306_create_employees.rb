class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.string :login
      t.boolean :active
      t.belongs_to :staff_role

      t.timestamps null: false
    end
  end
end
