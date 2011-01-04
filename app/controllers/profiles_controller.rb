class ProfilesController < ApplicationController
  before_filter :require_login

  def new
    @user = User.find(params[:user_id])
    @profile = Profile.new
    @skills = Skill.all
  end

  def show
    @user = User.find(params[:user_id])    
    @profile = Profile.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @profile = Profile.new(params[:profile].merge(:user_id => params[:user_id]))
    if @profile.save
      @profile.save_skills(params) unless params[:skills].blank?
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
    @skills = Skill.all
  end

  def update
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      @profile.update_skills(params) unless params[:skills].blank?
      flash[:notice] = "Profile was successfully updated."
      redirect_to user_profile_path(@user, @profile)
    else
      flash[:notice] = "Profile couldn't been updated."
      render :edit
    end
  end

  def delete_skill
    profile = Profile.find(params[:profile_id])
    profile_skill= profile.profile_skills.select { |p_skill| p_skill.skill_id == params[:skill_id].to_i }.first
    profile_skill.delete
    redirect_to user_profile_path(params[:user_id],profile)
  end

end
