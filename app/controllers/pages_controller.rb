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
    render :contact
  end

end
