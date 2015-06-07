class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.datetime :start
      t.datetime :end

      t.timestamps null: false
    end
  end
end
