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
    # id is required to deal with form
    @contact = Contact.new(:id => 1)
  end

  def send_contact
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to('/', :notice => "Contact email was successfully sent.")
    else
      flash[:alert] = "You must fill all fields."
      render :contact
    end
  end
  
  
  def home
  @requests = []
   if current_user
     case current_user.role
        when "user"
        @requests = Request.where("user_id=#{current_user.id}" )# only this users requests
        when "postcrew"
        @requests = Request.where("user_id=2") # only requests with status = approved and not complete
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

