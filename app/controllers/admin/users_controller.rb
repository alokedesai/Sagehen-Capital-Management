class Admin::UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.assign_attributes user_params
    if @user.valid?
      @user.save
      flash[:notice] = "You successfully updated your profile"
      redirect_to admin_user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to :back
    end
  end

  def approve
    # approved could be false or nil
    @users = User.where.not(approved: true)
  end

  def approve_user
    user = User.find params[:id]
    user.update_attributes :approved => true
    flash[:notice] = "User successfully added"
    redirect_to approve_admin_users_path
  end
  private
  def user_params
    params.require(:user).permit(:name, :major, :grad_year, :description)
  end
end
