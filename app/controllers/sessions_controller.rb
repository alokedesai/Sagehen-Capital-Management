class SessionsController < ApplicationController
  def create
		user = User.find_or_create_from_auth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to root_url
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
