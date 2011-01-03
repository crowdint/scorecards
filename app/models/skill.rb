class Skill < ActiveRecord::Base
  validates_uniqueness_of :name, :message => "You already have 1 skill with the same name"
  validates_presence_of :name, :description, :message => "You forget something!"
  has_many :profile_skills
  has_many :profiles, :through => :profile_skills

  def grade

  end
end
