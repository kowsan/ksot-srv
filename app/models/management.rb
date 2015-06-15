class Management < ActiveRecord::Base
  has_many :areas
  has_many :subdivisions, :through => :areas
  validates_presence_of :name
  def can_delete?
    areas.first.nil?
  end
end
