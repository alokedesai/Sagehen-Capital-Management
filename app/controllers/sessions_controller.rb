class SessionsController < ApplicationController
  def create
		user = User.find_or_create_from_auth(env["omniauth.auth"])
		if user.valid?
			user.save!
			session[:user_id] = user.id

    		# user is now logged in so redirect her to the backend page
			redirect_to admin_stocks_url
		else
			flash[:error] = user.errors.full_messages.join(", ")
			redirect_to :back
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
