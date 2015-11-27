class AddFistSecond < ActiveRecord::Migration
  def change
    change_table :turn_close_infos do |t|
      t.boolean :first,:default=> false
      t.boolean :second,:default=> false
    end
    add_foreign_key :turn_close_infos,:users,:column=>:closed_by_id
    add_foreign_key :turn_close_infos,:turn_types
  end
end
