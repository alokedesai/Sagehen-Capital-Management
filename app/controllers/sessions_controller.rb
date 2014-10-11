class SessionsController < ApplicationController
  def create
		user = User.find_or_create_from_auth(env["omniauth.auth"])
		session[:user_id] = user.id

    # user is now logged in so redirect her to the backend page
		redirect_to admin_stocks_url
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
