class User < ActiveRecord::Base
  has_one :profile, :dependent => :destroy
  
  def admin
    self.is_admin?
  end

  def delete
    self.update_attributes(:active => false)
  end
end