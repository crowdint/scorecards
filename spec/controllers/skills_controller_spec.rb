require 'spec_helper'

describe SkillsController do
  fixtures :skills

  describe "GET 'index'" do
    it "is successful" do
      get :index
      response.should be_success
    end

    it "assigns @skills" do
      get :index
      assigns(:skills).should_not be_nil
    end

    it "renders index template" do
      get :index
      response.should render_template('index')
    end
  end
  describe "GET 'new'" do
    it 'is successful' do
      get :new
      response.should be_success
    end

    it "assigns @skill" do
      get :new
      assigns(:skill).should_not be_nil
    end

    it "renders the 'new' template" do
      get :new
      response.should render_template('new')
    end
  end  
  describe "POST 'create'" do
    before(:each) do
      @skill = Skill.new
      @skill.stub(:id).and_return(1)
    end

    context "The save is successful" do
      before(:each) do
        Skill.should_receive(:new).and_return(@skill)
        @skill.should_receive(:save).and_return(true)
      end

      it "redirects to the 'show' action" do
        post :create, :skill => @skill.attributes
        response.should redirect_to(skills_path) # Put the right show path here
      end

      it "sets a flash message" do
        post :create, :skill => @skill.attributes
        flash[:notice].should == 'Skill was successfully created.'
      end
    end

    context "the save fails" do
      before(:each) do
        @skill.should_receive(:save).and_return(false)
        Skill.should_receive(:new).and_return(@skill)
      end

      it "renders the 'new' action" do
        post :create, :skill => @skill.attributes
        response.should render_template(:new)
      end

      it "assigns @skill" do
        post :create, :skill => @skill.attributes
        assigns(:skill).should_not be_nil
      end
    end
  end  
  describe "GET 'edit'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @skill = skills(:one)
    end

    it 'is successful' do
      get :edit, :id => @skill.id
      response.should be_success
    end

    it "assigns @skill" do
      get :edit, :id => @skill.id
      assigns(:skill).should_not be_nil
    end

    it "renders the 'edit' template" do
      get :edit, :id => @skill.id
      response.should render_template('edit')
    end
  end  
  describe "PUT 'update'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @skill = skills(:one)
    end

    context "the update is successful" do
      before(:each) do
        @skill.should_receive(:update_attributes).and_return(true)
        Skill.should_receive(:find).with(@skill.id).and_return(@skill)
      end

      it "redirects to 'show' action" do
        put :update, :id => @skill.id, :skill => {} # Add here some attributes for the model
        response.should redirect_to(skills_path) # Put the right show path here
      end

      it "sets a flash message" do
        put :update, :id => @skill.id, :skill => {} # Add here some attributes for the model
        flash[:notice].should == 'Skill was successfully updated.' # Your flash message here
      end
    end

    context "the update fails" do
      before(:each) do
        @skill.should_receive(:update_attributes).and_return(false)
        Skill.should_receive(:find).with(@skill.id).and_return(@skill)
      end

      it "renders the 'edit' action" do
        put :update, :id => @skill.id, :skill => {} # Add here some attributes for the model
        response.should render_template(:edit)
      end

      it "assigns @skill" do
        put :update, :id => @skill.id, :skill => {} # Add here some attributes for the model
        assigns(:skill).should_not be_nil
      end
    end
  end  
  describe "DELETE 'destroy'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @skill = skills(:one)
      Skill.should_receive(:find).with(@skill.id).and_return(@skill)
    end

    it "should delete the skill" do
      @skill.should_receive(:delete).and_return(true)
      delete :destroy, :id => @skill.id
    end

    it "should redirect to index page" do
      delete :destroy, :id => @skill.id
      response.should redirect_to(:skills)
    end

    it "sets a flash message" do
      delete :destroy, :id => @skill.id
      flash[:notice].should == 'Skill was successfully destroyed.' # Your flash message here
    end
  end
end
