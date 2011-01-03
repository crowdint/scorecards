class WelcomeController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def fail

  end
end
