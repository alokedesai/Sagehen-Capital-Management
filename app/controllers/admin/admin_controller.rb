class Admin::AdminController < ApplicationController
  before_filter :verify_admin
  before_filter :verify_approved

  private
  def verify_admin
    redirect_to root_url unless current_user
  end

  def verify_approved
    unless current_user.approved
      flash[:error] = "An admin has not approved you to access the backend yet."
      redirect_to root_url
    end
  end
end
