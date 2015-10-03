class AddFkTurns < ActiveRecord::Migration
  def change
    add_foreign_key :turn_schemes,:turn_types
  end
end
