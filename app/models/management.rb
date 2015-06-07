class Management < ActiveRecord::Base
  has_many :areas
  has_many :subdivisions,:through => :areas
end
