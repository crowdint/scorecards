class SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(params[:skill])
    if @skill.save
      flash[:notice] = 'Skill was successfully created.'
      redirect_to skills_path
    else
      flash[:notice] = "Skill couldn't been created."
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update_attributes(params[:skill])
      flash[:notice] = 'Skill was successfully updated.'
      redirect_to skills_path
    else
      flash[:notice] = "Skill couln't been updated."
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.delete
    flash[:notice] = "Skill was successfully destroyed."
    redirect_to skills_path
  end
end
