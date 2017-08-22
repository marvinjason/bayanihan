class HomeController < ApplicationController

  def index
    @client = Twitter::REST::Client.new do |config|
      config.access_token        = current_user.oauth_token
      config.access_token_secret = current_user.oauth_secret
      config.consumer_key        = current_user.consumer_key
      config.consumer_secret     = current_user.consumer_secret
    end

    filters = %w{BayanihanFirePost BayanihanQuakePost BayanihanStormPost}

    tweets = @client.user_timeline
    tweets.each do |tweet|
      if filters.any?{ |filter| tweet.text.include?(filter) }
        unless Tweet.find_by_uid(tweet.id)
          Tweet.create(uid: tweet.id, message: tweet.text, user_id: current_user.id)
        end

        break
      end
    end

    @tweets = Tweet.all
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
