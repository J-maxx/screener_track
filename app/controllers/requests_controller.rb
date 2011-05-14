class RequestsController < ApplicationController
  
  def new
    @request = Request.new(:user_id => current_user.id)
  end

  def create
    @request = Request.new(params[:request])
      if @request.save
        redirect_to root_url, :flash => {:success => "New request #{"@request.asset.version_name"} has been created."}
      else
        render 'new'
    end
  end

  def index
     @requests = []
       if current_user
         case current_user.role
            when "user","postcrew"
            @requests = Request.where("user_id=#{current_user.id}" )# only this users requests
            @buttons =['edit']
            when "approver"
            @requests = Request.where("status='requested'") # only requests with status = approved and not complete
            @buttons= ['approve','reject']
            when "manager"
            @requests = Request.all # only requests with status = approved and not complete
            @requests = Request.where("status='approved' or status='rejected'")
            @buttons =['fulfill']
            else
            @requests=[] # this is an error, should raise an exception
         end
         render 'index'
       else
          redirect_to login_path

      end

    end


  def show
    @request = Request.find(params[:id])
  end

  def edit
    @request = Request.find(params[:id])
  end
  
  def process_request
    render params.inspect
  #  render "pages/faq"  # just to see if we get here.
  end

  def update
     @request = Request.find(params[:id])
       if @request.update_attributes(params[:request])
         redirect_to requests_path, :flash => {:success => "Request profile updated successfully."}
       else
         render 'edit'
     end
  end
end

