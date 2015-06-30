class AddCriticalTypeWeight < ActiveRecord::Migration
  def change
    add_column :critical_types,:weight,:integer,:default => 1
  end
end
