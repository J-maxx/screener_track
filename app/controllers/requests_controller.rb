class RequestsController < ApplicationController
  
  def new
    @request = Request.new(:user_id => current_user, :asset_id=> params[:asset_id])
    @asset = Asset.find(params[:asset_id])
  end

  def create
    @request = current_user.requests.build(params[:request])
    @request.status = 'requested'
      if @request.save
        redirect_to root_url, :notice => "New request #{@request.asset.version_name} has been created."
      else
        render 'new'
    end
  end

  def index
     @requests = []
     @buttons = []
       if current_user
         case current_user.role
            when "user","postcrew"
            @requests = Request.where("user_id=#{current_user.id}" )# only this users requests
            @buttons =[]
            when "approver"
            @requests = Request.where(:status => 'requested') # only requests with status = approved and not complete
            @buttons= ['approve','reject']
            when "manager"
            @requests = Request.all # only requests with status = approved and not complete
            @requests = Request.where(:status => 'approved')
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
  
  def process_request action
    @request = Request.find(params[:request_id])
    case action
      when "approve","reject"
        @request.status=action +( (action=='approve') ? 'd' : 'ed')
        @request.approver_id=current_user.id
      when "fulfill"
         @request.status = 'fulfilled' 
      end
      if @request.save
          redirect_to requests_url, :flash => {:success => "Request for #{@request.asset.version_name} has been "+@request.status+"."}
        else
          redirect_to root_url, :flash => {:failure => "Something terrible has gone wrong!"}  
      end
  end
  
  def approve
    process_request 'approve'
  end
  
  def reject
     process_request 'reject'
  end
  
  def fulfill
      process_request 'fulfill'
  end

  def update
     @request = Request.find(params[:id])
     if @request.update_attributes(params[:request])
       redirect_to requests_path, :flash => {:success => "Request profile updated successfully."}
     else
       render 'edit'
     end
  end
   
  def destroy
     @request = Request.find(params[:id])
     @request.destroy
     redirect_to requests_path, :flash => {:success => "Request destroyed."}
  end
  
end

