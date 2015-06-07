class CreateWorkSpaces < ActiveRecord::Migration
  def change
    create_table :work_spaces do |t|
      t.string :name
      t.string :code
      t.string :short_name
      t.belongs_to :auto_work_space
      t.belongs_to :subdivision
      t.boolean :is_used
      t.timestamps null: false
    end
  end
end
