require "spec_helper"

describe "User validations" do

  context "Mail validations" do

    context "#presence" do
      before do
        @params = {:is_admin => 1, :mail => nil}
      end
      it "should validate mail presence" do
        user   = User.create(@params)
        user.should_not be_valid
      end

      it "should raise a error about presence" do
        lambda { User.create!(@params) }.should raise_error(ActiveRecord::RecordInvalid,"Validation failed: Mail can't be blank")
      end
    end

    context "#uniqueness" do
      before do
        @params = {:is_admin => 1, :mail => "jj@jj.com"}
        User.create!(@params)
      end

      it "should be a unique mail" do
        lambda {User.create!(@params)}.should raise_error(ActiveRecord::RecordInvalid, "Validation failed: Mail is already in use")
      end
    end
  end
end

describe "model methods" do
  context "#admin" do
    it "should return false after create without is_admin" do
      user = User.create!(:mail => "jj@jj.com")
      user.admin.should == false 
    end
    it "should return true after update is_admin" do

    end
    it "should return true after create with is_admin" do

    end
  end
end