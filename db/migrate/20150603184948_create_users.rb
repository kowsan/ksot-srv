class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :login
      t.boolean :is_active,:default => true
      t.string :position
      t.belongs_to :staff_role
      t.belongs_to :subdivision
      t.timestamps null: false
    end
  end
end
