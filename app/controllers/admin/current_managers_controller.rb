class Admin::CurrentManagersController < Admin::SpecialAccessController
  def index
    @current_managers = CurrentManager.all.order "position_order DESC"
  end

  def new
    @current_manager = CurrentManager.new
  end

  def create
    @current_manager = CurrentManager.new current_manager_params
    if @current_manager.valid?
      @current_manager.save

      #give the corresponding user special access to the site
      @current_manager.user.update_attribute :special_access, true

      redirect_to admin_current_managers_path
    else
      flash[:error] = @current_manager.full_messages.join(", ")
      redirect_to :back
    end
  end

  def edit
    @current_manager = CurrentManager.find params[:id]
  end

  def update
    @current_manager = CurrentManager.find params[:id]
    @current_manager.assign_attributes current_manager_params
    if @current_manager.valid?
      @current_manager.save
      flash[:success] = "Manager successfully saved"
      redirect_to admin_current_managers_path
    else
      flash[:error] = @current_manager.full_messages.join(", ")
      redirect_to :back
    end
  end

  def show
    @current_manager = CurrentManager.find params[:id]
  end

  def destroy
    current_manager = CurrentManager.find params[:id]

    # remove special access from the corresponding user
    current_manager.user.update_attribute :special_access, false

    current_manager.destroy
    redirect_to :back
  end

  private
  def current_manager_params
    params.require(:current_manager).permit(:title, :is_vp, :user_id, :position_order, :executive)
  end
end
