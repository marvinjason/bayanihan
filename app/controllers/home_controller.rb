class HomeController < ApplicationController

  def index

  end

  def static

  end

  def logout
  	redirect_to url_for :controller => 'sessions', :action => 'destroy'
  end

  def authenticated
  	if !current_user.nil?
  		redirect_to :action => 'index'
  	else
  		#redirect_to :action => 'static'
  		render 'static'
  	end
  end
  
end
