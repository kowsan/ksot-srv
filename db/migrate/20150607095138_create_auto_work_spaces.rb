class CreateAutoWorkSpaces < ActiveRecord::Migration
  def change
    create_table :auto_work_spaces do |t|
      t.string :uuid
      t.string :computername
      t.string :short_name
      t.string :os
      t.string :os_user
      t.text :comment
      t.string :location
      t.boolean :is_used, :default => true
      t.boolean :allow_anonymous, :default => true
      t.timestamps null: false
    end
  end
end
