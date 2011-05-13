class RequestsController < ApplicationController
  
  def new
    @request = Request.new(:user_id => current_user)
    @asset = Asset.find(params[:asset_id])
  end

  def create
    @request = current_user.requests.build(params[:request])
      if @request.save
        redirect_to root_url, :flash => {:success => "New request #{@request.asset.version_name} has been created."}
      else
        render 'new'
    end
  end

  def index
    @requests = Request.all(params[:request])
  end

  def show
    @request = Request.find(params[:id])
  end

  def edit
    @request = Request.find(params[:id])
  end
  
  def process_request
    render "pages/faq"  # just to see if we get here.
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

