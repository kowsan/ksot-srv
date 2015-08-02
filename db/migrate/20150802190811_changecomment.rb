class Changecomment < ActiveRecord::Migration
  def change
    change_column_default :turn_schemes,:comment,''
  end
end
