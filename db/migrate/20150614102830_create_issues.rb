class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.belongs_to :user
      t.belongs_to :status
      t.belongs_to :work_space

      t.datetime :close_date
      t.datetime :due_date


      t.timestamps null: false
    end
  end
end
