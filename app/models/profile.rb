class Profile < ActiveRecord::Base
  has_many :knowledge, :class_name => :skills
  has_many :expertise, :class_name => :skills
end
