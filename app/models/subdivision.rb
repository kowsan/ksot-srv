class Subdivision < ActiveRecord::Base
  has_many :users
  belongs_to :area


end
