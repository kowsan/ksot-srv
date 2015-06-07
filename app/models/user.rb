class User < ActiveRecord::Base
  belongs_to :staff_role
  belongs_to :subdivision

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable
  validates_presence_of :login,:first_name,:last_name
  validates_associated :staff_role,:subdivision
end
