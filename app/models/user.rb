class User < ActiveRecord::Base
  belongs_to :staff_role
  belongs_to :subdivision
  has_many :issues

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable
  validates_presence_of :login,:first_name,:last_name,:staff_role_id,:subdivision_id
 # validates_associated :staff_role,:subdivision
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
