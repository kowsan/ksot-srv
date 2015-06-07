class StaffRole < ActiveRecord::Base
  has_many :users
end
