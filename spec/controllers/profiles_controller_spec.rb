require 'spec_helper'

describe ProfilesController do
  fixtures :all

before do
  @user = users(:admin)
end
  describe "GET 'show'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @profile = profiles(:one)
    end

    it 'is successful' do
      get :show, :user_id => @user.id, :id => @profile.id
      response.should be_success
    end

    it "assigns @profile" do
      get :show, :user_id => @user.id, :id => @profile.id
      assigns(:profile).should_not be_nil
    end

    it "renders the 'show' template" do
      get :show, :user_id => @user.id, :id => @profile.id
      response.should render_template('show')
    end
  end  
  describe "GET 'new'" do
    it 'is successful' do
      get :new, :user_id => @user.id
      response.should be_success
    end

    it "assigns @profile and @user" do
      get :new, :user_id => @user.id
      assigns(:user).should_not be_nil
      assigns(:profile).should_not be_nil
    end

    it "renders the 'new' template" do
      get :new, :user_id => @user.id
      response.should render_template('new')
    end
  end  
  describe "POST 'create'" do
    before(:each) do
      @profile = Profile.new
      @profile.stub(:id).and_return(1)
    end

    context "The save is successful" do
      before(:each) do
        Profile.should_receive(:new).and_return(@profile)
        @profile.should_receive(:save).and_return(true)
      end

      it "redirects to the 'show' action" do
        post :create, :user_id => @user.id, :profile => @profile.attributes
        response.should redirect_to(user_profile_path(@user, @profile)) # Put the right show path here
      end

      it "sets a flash message" do
        post :create, :user_id => @user.id, :profile => @profile.attributes
        flash[:notice].should == 'Profile was successfully created.'
      end
    end

    context "the save fails" do
      before(:each) do
        @profile.should_receive(:save).and_return(false)
        Profile.should_receive(:new).and_return(@profile)
      end

      it "renders the 'new' action" do
        post :create, :user_id => @user.id, :profile => @profile.attributes
        response.should render_template(:new)
      end

      it "assigns @profile" do
        post :create, :user_id => @user.id, :profile => @profile.attributes
        assigns(:profile).should_not be_nil
      end

      it "sets a flash message" do
        post :create, :user_id => @user.id, :profile => @profile.attributes
        flash[:notice].should == 'Profile could not been created.'
      end
    end
  end  
  describe "GET 'edit'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @profile = profiles(:one)
    end

    it 'is successful' do
      get :edit, :user_id => @user.id, :id => @profile.id
      response.should be_success
    end

    it "assigns @profile" do
      get :edit, :user_id => @user.id, :id => @profile.id
      assigns(:profile).should_not be_nil
    end

    it "renders the 'edit' template" do
      get :edit, :user_id => @user.id, :id => @profile.id
      response.should render_template('edit')
    end
  end  
  describe "PUT 'update'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @profile = profiles(:one)
    end

    context "the update is successful" do
      before(:each) do
        @profile.should_receive(:update_attributes).and_return(true)
        Profile.should_receive(:find).with(@profile.id).and_return(@profile)
      end

      it "redirects to 'show' action" do
        put :update, :user_id => @user.id, :id => @profile.id, :profile => {} # Add here some attributes for the model
        response.should redirect_to(user_profile_path(@user, @profile)) # Put the right show path here
      end

      it "sets a flash message" do
        put :update, :user_id => @user.id, :id => @profile.id, :profile => {} # Add here some attributes for the model
        flash[:notice].should == 'Profile was successfully updated.' # Your flash message here
      end
    end

    context "the update fails" do
      before(:each) do
        @profile.should_receive(:update_attributes).and_return(false)
        Profile.should_receive(:find).with(@profile.id).and_return(@profile)
      end

      it "renders the 'edit' action" do
        put :update, :user_id => @user.id, :id => @profile.id, :profile => {} # Add here some attributes for the model
        response.should render_template(:edit)
      end

      it "assigns @profile" do
        put :update, :user_id => @user.id, :id => @profile.id, :profile => {} # Add here some attributes for the model
        assigns(:profile).should_not be_nil
      end
    end
  end
end
