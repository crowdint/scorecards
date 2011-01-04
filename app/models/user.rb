class User < ActiveRecord::Base
  has_one :profile, :dependent => :destroy

  validates_presence_of :mail
  validates_uniqueness_of :mail, :message => "is already in use"

  def admin
    self.is_admin?
  end

  def delete
    self.update_attributes(:active => false)
  end
end