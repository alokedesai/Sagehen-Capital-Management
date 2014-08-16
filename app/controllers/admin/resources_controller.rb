class Admin::ResourcesController < Admin::AdminController
  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    resource = Resource.new resource_params
    if resource.valid?
      resource.save
      flash[:notice] = "Resource successfully added"
    else
      flash[:error] = resource.errors.full_messages.join(", ")
    end
    redirect_to :back
  end

  def edit
    @resource = Resource.find params[:id]
  end

  def update
    @resource = Resource.find params[:id]
    @resource.assign_attributes resource_params
    if @resource.valid?
      @resource.save
      flash[:notice] = "Resource successfully added"
    else
      flash[:error] = @resource.errors.full_messages.join(", ")
    end
    redirect_to :back
  end

  def destroy
    resource = Resource.find params[:id]
    resource.destroy
    redirect_to admin_resources_path
  end

  private
  def resource_params
    params.require(:resource).permit(:title, :url)
  end
end
