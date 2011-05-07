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
    @requests = Request.all(params[:request])
  end

  def show
    @request = Request.find(params[:id])
  end

  def edit
    @request = Request.find(params[:id])
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

