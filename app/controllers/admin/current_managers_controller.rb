class Admin::CurrentManagersController < Admin::AdminController
  def index
    @current_managers = CurrentManagement.all
  end

  def new
    @current_manger = CurrentManagement.new
  end

  def create
    @current_manager = CurrentManagement.new current_managers_param
    if @current_manager.valid?
      @current_manager.save
      redirect_to admin_current_managers_path
    else
      flash[:error] = @current_manager.full_messages.join(", ")
      redirect_to :back
    end
  end
  
  private
  def current_managers_param
    params.require(:user).permit(:title, :is_vp, :user_id)
  end
end
