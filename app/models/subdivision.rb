class Subdivision < ActiveRecord::Base
  has_many :users, unscoped: true
  belongs_to :area
  has_many :work_spaces
  #validates_associated :area,:allow_nil => false,:allow_blank => false
  validates_presence_of :name
  validates_presence_of :area_id, :message => 'Не могут быть пустыми'


end
