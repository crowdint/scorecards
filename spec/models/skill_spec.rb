require 'spec_helper'

describe "name are mandatory" do
  context "with name and description" do
     before do
      @skill = Skill.create(:name => "SkillName", :description => "blah blah")
    end
    it "should be valid" do
      @skill.should be_valid
    end
  end

  context "without name or description" do
    before do
      @skill = Skill.create
    end
    it "should return name errors" do
      @skill.should_not be_valid
      @skill.errors_on(:name).should have(1).error_on(:name)
    end

    it "should return name errors" do
      @skill.should_not be_valid
      @skill.errors_on(:description).should have(1).error_on(:description)
    end
  end

  context "given a duplicate name" do
    before do
      @skill1 = Skill.create(:name => "skill1", :description => "aasdfs")
      @skill2 = Skill.create(:name => "skill1", :description => "dsada")
    end
    it "should return a error on name" do
      @skill2.should_not be_valid
      @skill2.errors_on(:name).should have(1).error_on(:name)
    end
  end
end