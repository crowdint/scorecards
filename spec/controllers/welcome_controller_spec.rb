require 'spec_helper'

describe WelcomeController do
  fixtures :all

  context "#index" do
    it "should be successful" do
      get :index
      response.should be_success
    end
    it "should set profiles" do
      get :index
      assigns(:profiles).should_not be_nil
    end
  end
end