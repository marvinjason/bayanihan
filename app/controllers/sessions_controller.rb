class SessionsController < ApplicationController
  def create
  	#render text: request.env['omniauth.auth'].to_yaml

  	@user = User.from_omniauth(request.env['omniauth.auth'])
  	session[:user_id] = @user.id

  	# save user to db
  	# set session['uid']
  	# redirect
  end

  def destroy

  	# logout

  end
end
