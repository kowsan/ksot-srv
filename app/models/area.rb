class Area < ActiveRecord::Base
  belongs_to :management
  has_many :subdivisions
  has_many :users, :through => :subdivisions
  has_many :work_spaces, :through => :subdivisions
  validates_presence_of :name, :management_id

  def can_delete?
    subdivisions.first.nil?
  end
end
