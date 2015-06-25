class Status < ActiveRecord::Base
  has_many :issues
end
