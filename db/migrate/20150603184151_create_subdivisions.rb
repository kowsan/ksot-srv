class CreateSubdivisions < ActiveRecord::Migration
  def change
    create_table :subdivisions do |t|
      t.string :name
      t.string :short_name
      t.belongs_to  :area

      t.timestamps null: false
    end
  end
end
