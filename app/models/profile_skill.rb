class ProfileSkill < ActiveRecord::Base
  belongs_to :profile
  belongs_to :skill
  scope :expertise, where("grade IN (4,5)")
  scope :knowledge, where("grade IN (1,2,3)")

  def name
    self.skill.name
  end
end
