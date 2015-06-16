class CreateCriticalTypes < ActiveRecord::Migration
  def change
    create_table :critical_types do |t|
      t.string :name
      t.string :color
      t.timestamps null: false
    end
  end
end
