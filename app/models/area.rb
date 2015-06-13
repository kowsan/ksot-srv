class Area < ActiveRecord::Base
  belongs_to :management
  has_many :subdivisions
  has_many :users, :through => :subdivisions
  validates_presence_of :name,:management_id

end
