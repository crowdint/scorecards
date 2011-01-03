class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :profile_skills
  has_many :skills, :through => :profile_skills

  validates_presence_of :user_id

  def save_skills(params)
    if params[:skills]
      params[:skills].each do |skill|
        @skill = ProfileSkill.create(:profile => self, :skill_id => skill[0], :grade => skill[1])
      end
    end
  end

  def update_skills(params)
    params[:skills].each do |sk|
     if  profile_skill= self.profile_skills.select { |p_skill| p_skill.skill_id == sk[0].to_i }.first
        profile_skill.update_attribute(:grade, sk[1])
     else
        ProfileSkill.create(:profile => self, :skill_id => sk[0], :grade => sk[1])
     end
    end if params[:skills]
  end
end
