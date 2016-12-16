class HomeController < ApplicationController

  def index
    @client = Twitter::REST::Client.new do |config|
      # config.consumer_key        = 'LDT5XIq06LX1uLuqRK1GoqSvx'
      # config.consumer_secret     = 'ZOvwH0V3xrZBI8GFldHgArE3ENxlimAZ3Oo72q3cJyjSEmaJ1g'
      # config.access_token        = '602365274-Fr4hhyDisi46awhGFMebLZgrKDCJ1K5Yk6mGX6BI'
      # config.access_token_secret = 'gkZYqn0UNkBmzufMGMqhtn3DAguLibdtepu5UCI9XHTme'

      config.consumer_key        = 'LDT5XIq06LX1uLuqRK1GoqSvx'
      config.consumer_secret     = 'ZOvwH0V3xrZBI8GFldHgArE3ENxlimAZ3Oo72q3cJyjSEmaJ1g'
      #config.access_token        = request.env['omniauth.auth'][:extra][:access_token]
      #config.access_token        = current_user.access_token
      #config.access_token_secret = request.env['omniauth.auth.credentials.secret']
      # TODO: Figure out how to get ENV for token & token secret.
    end

    @client.search('#BayanihanFirePost', result_type: "recent").take(30).collect do |tweet|
      Tweet.new(:message => tweet.text, :user_id => current_user.id).save
    end

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
