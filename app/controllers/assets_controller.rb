class AssetsController < ApplicationController
  
  def new
    @asset = Asset.new
  end

  def create
    @asset = Asset.new(params[:asset])
      if @asset.save
        redirect_to root_url, :flash => {:success => "New asset #{@asset.version_name} has been created."}
      else
        render 'new'
    end
  end

  def index
    @assets = Asset.all(params[:asset])
  end

  def show
    @asset = Asset.find(params[:id])
  end
  
  def edit
    @asset = Asset.find(params[:id])
  end

  def update
     @asset = Asset.find(params[:id])
       if @asset.update_attributes(params[:asset])
         redirect_to assets_path, :flash => {:success => "Project profile updated successfully."}
       else
         render 'edit'
     end
  end
end