class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :Management
      t.string :name
      t.string :short_name
      t.belongs_to :management

      t.timestamps null: false
    end
  end
end
