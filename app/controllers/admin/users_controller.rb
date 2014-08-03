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

  private
  def user_params
    params.require(:user).permit(:name, :major, :grad_year, :description, :title)
  end
end
