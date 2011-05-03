require 'spec_helper'

describe 'Application Routing' do
  
  describe PagesController do 
    
    it 'recognizes and routes pages/about' do
    {:get => '/about'}.should route_to :controller => 'pages', :action => 'about'
    end
  
    it 'recognizes and routes pages/about' do
    {:get => '/faq'}.should route_to :controller => 'pages', :action => 'faq'
    end
    it 'recognizes and routes pages/about' do
    {:get => '/policies'}.should route_to :controller => 'pages', :action => 'policies'
    end
    it 'recognizes and routes pages/about' do
    {:get => '/contact'}.should route_to :controller => 'pages', :action => 'contact'
    end
  end

  describe SessionsController do
     it 'recognizes and routes session/create' do
      {:get => session_create_path}.should route_to :controller => 'sessions', :action => 'create'
    end
  end
  
end
