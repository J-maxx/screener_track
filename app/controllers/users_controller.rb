class UsersController < ApplicationController
  
  def new
   @user = User.new
   
  end
  
  def create
    @user = User.new(params[:user])
    @user.role= params[:role]
    
      if @user.save
       redirect_to create_session_path , :notice => 'You are signed up.'
      #  redirect_to root_url, :notice => 'You are signed up.'
      else
        render 'new'
    end
  end
end
