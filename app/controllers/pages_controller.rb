

class User2
attr_accessor :role, :name, :email
 def initialize
    @role= ['guest','user','crew','manager','approver'][rand(5)]
    @name = 'fred'
     @email = 'fred@mailinator.com'
  end
end

 class Requests
   attr_accessor :asset, :request_id, :request_status
  def initialize
      @asset= ['Hanna','One Day','Pariah','The Debt','approver'][rand(4)]
     @request_id = 'fred'
     @request_status = ['sent','approved','fufilled','destroyed'][rand(4)]
   end
 end



class PagesController < ApplicationController
  
  before_filter :fake_data, :only => [:index]
  
  def fake_data
         @user = User2.new
         @requests =[]
            (1..10).each {@requests<< Requests.new}
       end
       
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
  
  def index
   # redirect_to roles_path(@user.role)
   @current_user = current_user
   render :roles
  end

end
