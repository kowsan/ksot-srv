class CreateTurnShemeWorkSpace < ActiveRecord::Migration
  def change
    change_table :work_spaces do |t|
      t.belongs_to :turn_scheme
    end

  end
end
