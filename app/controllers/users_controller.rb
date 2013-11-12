class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
   @user = User.find(params[:id])
    if params[:user][:photo] && @user == current_user
       
      if @user.update_attributes({"photo" => params[:user][:photo]})
       redirect_to @user, :notice => "Photo added."
     else
       redirect_to @user, :alert => "Failed to add photo."
     end
      
    else
     authorize! :update, @user, :message => 'Not authorized as an administrator.'
     
     if @user.update_attributes(params[:user])
       redirect_to @user, :notice => "User updated."
     else
       redirect_to @user, :alert => "Unable to update user."
     end
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
  
  def removephoto
    user = User.find(params[:id])
    if user == current_user
      user.photo.destroy
      redirect_to user, :notice => "Profile photo removed."
    else
      redirect_to user, :notice => "You can only remove your own profile photo."
    end
  end
  
    def addphoto
    user = User.find(params[:id])
    if user == current_user
    if user.update_attributes(params[:photo])
      redirect_to @user, :notice => "User updated."
    else
      redirect_to @user, :alert => "Unable to update user."
    end
    else
      redirect_to user, :notice => "You can only add your own profile photo."
    end
  end
end