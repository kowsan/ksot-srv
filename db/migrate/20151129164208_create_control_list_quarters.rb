class CreateControlListQuarters < ActiveRecord::Migration
  def change
    create_table :control_list_quarters do |t|
      t.date :form_date
      t.belongs_to :author, :class_name => "User", index: true
      t.belongs_to :subdivision, index: true, foreign_key: true
      t.timestamps null: false
    end

    add_foreign_key :control_list_quarters, :users, column: :author_id


  end
end
