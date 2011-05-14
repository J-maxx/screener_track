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
    @assets=Asset.all
  end
end

