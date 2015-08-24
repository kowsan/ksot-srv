class Add2FlagturnType < ActiveRecord::Migration
  def change
    add_column :turn_types,:support2,:boolean,:default => true
  end
end
