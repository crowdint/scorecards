require 'spec_helper'

describe UsersController do
  fixtures :users
before(:all) do
  @user = User.first
  current_user = @user
end

  describe "GET 'index'" do
    it "is successful" do
      get :index
      response.should be_success
    end

    it "assigns @user" do
      get :index
      assigns(:users).should_not be_nil
    end

    it "renders index template" do
      get :index
      response.should render_template('index')
    end
  end
  
  describe "GET 'show'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @user = users(:admin)
    end

    it 'is successful' do
      get :show, :id => @user.id
      response.should be_success
    end

    it "assigns @user" do
      get :show, :id => @user.id
      assigns(:user).should_not be_nil
    end

    it "renders the 'show' template" do
      get :show, :id => @user.id
      response.should render_template('show')
    end
  end  
  describe "GET 'new'" do
    it 'is successful' do
      get :new
      response.should be_success
    end

    it "assigns @user" do
      get :new
      assigns(:user).should_not be_nil
    end

    it "renders the 'new' template" do
      get :new
      response.should render_template('new')
    end
  end  
  describe "POST 'create'" do
    before(:each) do
      @user = User.new
      @user.stub(:id).and_return(1)
    end

    context "The save is successful" do
      before(:each) do
        User.should_receive(:new).and_return(@user)
        @user.should_receive(:save).and_return(true)
      end

      it "redirects to the 'show' action" do
        post :create, :user => @user.attributes
        response.should redirect_to(user_path(@user)) # Put the right show path here
      end

      it "sets a flash message" do
        post :create, :user => @user.attributes
        flash[:notice].should == 'User was successfully created.'
      end
    end

    context "the save fails" do
      before(:each) do
        @user.should_receive(:save).and_return(false)
        User.should_receive(:new).and_return(@user)
      end

      it "renders the 'new' action" do
        post :create, :user => @user.attributes
        response.should render_template(:new)
      end

      it "assigns @user" do
        post :create, :user => @user.attributes
        assigns(:user).should_not be_nil
      end
    end
  end  
  describe "GET 'edit'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @user = users(:admin)
    end

    it 'is successful' do
      get :edit, :id => @user.id
      response.should be_success
    end

    it "assigns @user" do
      get :edit, :id => @user.id
      assigns(:user).should_not be_nil
    end

    it "renders the 'edit' template" do
      get :edit, :id => @user.id
      response.should render_template('edit')
    end
  end  
  describe "PUT 'update'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @user = users(:admin)
    end

    context "the update is successful" do
      before(:each) do
        @user.should_receive(:update_attributes).and_return(true)
        User.should_receive(:find).with(@user.id).and_return(@user)
      end

      it "redirects to 'show' action" do
        put :update, :id => @user.id
        response.should redirect_to(user_path(@user)) # Put the right show path here
      end

      it "sets a flash message" do
        put :update, :id => @user.id, :user => {} # Add here some attributes for the model
        flash[:notice].should == 'User was successfully updated.' # Your flash message here
      end
    end

    context "the update fails" do
      before(:each) do
        @user.should_receive(:update_attributes).and_return(false)
        User.should_receive(:find).with(@user.id).and_return(@user)
      end

      it "renders the 'edit' action" do
        put :update, :id => @user.id, :user => {} # Add here some attributes for the model
        response.should render_template(:edit)
      end

      it "assigns @user" do
        put :update, :id => @user.id, :user => {} # Add here some attributes for the model
        assigns(:user).should_not be_nil
      end
    end
  end  
  describe "DELETE 'destroy'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @user = users(:admin)
      User.should_receive(:find).with(@user.id).and_return(@user)
    end

    it "should delete the user" do
      @user.should_receive(:delete).and_return(true)
      delete :destroy, :id => @user.id
    end

    it "should redirect to index page" do
      delete :destroy, :id => @user.id
      response.should redirect_to(:users)
    end

    it "sets a flash message" do
      delete :destroy, :id => @user.id
      flash[:notice].should == 'User was successfully destroyed.' # Your flash message here
    end
  end
end
