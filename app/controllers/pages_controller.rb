class PagesController < ApplicationController
  def about
    render :about
  end

  def faq
    render :faq
  end

  def policies
    render :policies
  end

  def contact
    render :contact
  end
  
  def home
  @requests = []
   if current_user
     case current_user.role
        when "user"
        @requests = Request.where("user_id=#{current_user.id}" )# only this users requests
        when "postcrew"
        @requests = Request.all #where("user_id=1") # only requests with status = approved and not complete
        when "manager"
        @requests = Request.all # only requests with status = approved and not complete
        else
        @requests=[] # this is an error, should raise an exception
     end
     render 'home'
   else
      redirect_to login_path
     
  end

end
end

