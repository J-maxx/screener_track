class ProjectsController < ApplicationController
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
      if @project.save
        redirect_to root_url, :flash => {:success => "New project #{@project.name} has been created."}
      else
        render 'new'
    end
  end

  def index
    @projects = Project.all(params[:project])
    # sort here?
  end

  def show
  end
  
  def edit
    @project = Project.find(params[:id])
  end

  def update
     @project = Project.find(params[:id])
       if @project.update_attributes(params[:project])
         redirect_to projects_path, :flash => {:success => "Project profile updated successfully."}
       else
         render 'edit'
     end
  end

end
