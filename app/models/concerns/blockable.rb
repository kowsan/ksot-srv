module Blockable
  extend ActiveSupport::Concern
  included do
    scope :blocked, ->{where(is_active: false)}
    scope :unblocked, ->{where(is_active: false)}
  end


  def block
    self.is_active=false
    self.save!
  end
  def unblock
    self.is_active=true
    self.save!
  end


end