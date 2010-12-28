class Skill < ActiveRecord::Base
  validates_uniqueness_of :name, :message => "You already have 1 skill with the same name"
  validates_presence_of :name, :description, :message => "You forget something!"
end
