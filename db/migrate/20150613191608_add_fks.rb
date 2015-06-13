class AddFks < ActiveRecord::Migration
  def change
    add_foreign_key :areas,:managements
    add_foreign_key :subdivisions,:areas
  end
end
