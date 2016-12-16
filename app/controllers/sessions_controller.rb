class SessionsController < ApplicationController
  def create
  	# render text: request.env['omniauth.auth'].to_yaml
  	begin
  		user = User.from_omniauth(request.env['omniauth.auth'])
  		session[:user_id] = user.id
  	rescue
  		# handle exception
  	end

  end

  def destroy

  	# logout
  	if !current_user.nil?
  		session.delete(:user_id)
  	end
  	redirect_to root_path

  end
end
