module ProfilesHelper
  def check_radio_skills(profile, skill, num)
    !profile.profile_skills.select { |sk| sk.skill_id == skill.id and sk.grade == num }.empty?
  end
end
