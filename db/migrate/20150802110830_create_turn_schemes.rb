class CreateTurnSchemes < ActiveRecord::Migration
  def change
    create_table :turn_schemes do |t|
      t.string :name
      t.text :comment
      t.references :turn_type
      t.timestamps null: false
    end
  end
end
