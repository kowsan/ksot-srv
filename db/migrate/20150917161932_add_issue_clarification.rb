class AddIssueClarification < ActiveRecord::Migration
  def change
    add_column :issues, :clarification, :string, :default => ''
  end
end
