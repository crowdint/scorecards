class UsersController < ApplicationController
  before_filter :require_login

  def index
    @users = User.where(:active => true)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User was successfully created."
      redirect_to users_path
    else
      flash[:notice] = "the user couldn't been created"
      flash[:errors] = @user.errors
      render :action => :new
    end
  end

  def edit
   @user = User.where(:id => params[:id]).first
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
       flash[:notice] = "User was successfully updated."
      redirect_to users_path
    else
      flash[:notice] = "the user couldn't been updated"
      flash[:errors] = @user.errors
      render :action => :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    flash[:notice] = "User was successfully destroyed."
    redirect_to users_path
  end

end
