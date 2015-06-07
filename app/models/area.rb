class Area < ActiveRecord::Base
  belongs_to :management
  has_many :subdivisions
  has_many :users, :through => :subdivisions
end
