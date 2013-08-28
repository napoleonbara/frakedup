class StaticPagesController < ApplicationController
  
  def home
    redirect_to contents_path if logged_in?
  end

  def help
  end

  def contents
  end

end
