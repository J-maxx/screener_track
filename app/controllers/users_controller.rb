class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
      if @user.save
        redirect_to root_url, :notice => 'You are signed up.'
      else
        render 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :flash => {:success => "Profile updated successfully."}
    else
      render 'edit'
    end
  end
end
