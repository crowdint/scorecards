class User < ActiveRecord::Base
  def admin
    self.is_admin?
  end

  def delete
    self.update_attributes(:active => false)
  end
end