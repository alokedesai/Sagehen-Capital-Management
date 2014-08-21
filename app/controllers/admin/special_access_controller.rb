class Admin::SpecialAccessController < Admin::AdminController
	before_filter :verify_special_access

	private
	def verify_special_access
    redirect_to root_url unless current_user.special_access
	end
end
