class DefIsActive < ActiveRecord::Migration
  def change
    change_column_default :control_list_factors, :is_active, true
  end
end
