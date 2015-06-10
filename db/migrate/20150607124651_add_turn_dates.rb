class AddTurnDates < ActiveRecord::Migration
  def change
  #  cre
    create_table :turn_dates do |t|
      t.date :day
      t.belongs_to :turn_type
    end
  end
end
