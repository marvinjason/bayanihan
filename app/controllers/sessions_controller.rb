class SessionsController < ApplicationController
  def create
  	render text: request.env['omniauth.auth'].to_yaml

  	# save user to db
  	# set session['uid']
  	# redirect
  end

  def destroy

  	# logout

  end
end
