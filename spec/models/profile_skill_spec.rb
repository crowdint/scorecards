require 'spec_helper'

describe "scopes" do
  fixtures :all

  before do
    @profile = Profile.first
    skill1   = skills(:one)
    skill2   = skills(:two)
    @skill_k = ProfileSkill.create(:profile_id => @profile.id, :skill_id => skill1.id, :grade => 3)
    @skill_e = ProfileSkill.create(:profile_id => @profile.id, :skill_id => skill2.id, :grade => 4)
  end


  context "Expertise skills" do
    it "should returns skills with grade between 4 and 5" do
      @profile.profile_skills.expertise.should include(@skill_e)
    end
  end

  context "knowledge skills" do
    it "should returns skills with grade between 1 and 3" do
      @profile.profile_skills.knowledge.should include(@skill_k)
    end
  end
end