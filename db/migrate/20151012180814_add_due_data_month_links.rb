class AddDueDataMonthLinks < ActiveRecord::Migration
  def change
    change_table :control_list_month_links   do |t|
      t.date :date_due


    end
  end
end
