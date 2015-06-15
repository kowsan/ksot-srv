class ChangeAnonMode < ActiveRecord::Migration
  def change
    change_column_default :auto_work_spaces,:allow_anonymous,false
  end
end
