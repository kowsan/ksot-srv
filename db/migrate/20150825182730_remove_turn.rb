class RemoveTurn < ActiveRecord::Migration
  def up
 drop_table :turns if table_exists?(:turns)
  end
end
