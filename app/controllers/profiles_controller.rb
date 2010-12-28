class ProfilesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @profile = Profile.new
  end

  def show
    @user = User.find(params[:user_id])    
    @profile = Profile.find(params[:id])
  end

  def create
    @user = params[:user_id]
    @profile = Profile.new(params[:profile])
    if @profile.save
      flash[:notice] = "Profile was successfully created."
      redirect_to user_profile_path(@user,@profile)
    else
      flash[:notice] = "Profile could not been created."
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
  end

  def update
    @user = params[:user_id]
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      flash[:notice] = "Profile was successfully updated."
      redirect_to user_profile_path(@user, @profile)
    else
      flash[:notice] = "Profile couldn't been updated."
      render :edit
    end
  end

end
