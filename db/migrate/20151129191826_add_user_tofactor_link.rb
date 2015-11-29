class AddUserTofactorLink < ActiveRecord::Migration
  def change
    change_table :control_list_quarter_links do |t|
      t.belongs_to :user,:foreign_key => true
    end

  end
end
