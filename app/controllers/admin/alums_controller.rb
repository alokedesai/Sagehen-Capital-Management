class Admin::AlumsController < Admin::AdminController
  def index
    # TODO: need a better way of writing this
    @alums_by_year = []
    years = Alum.pluck(:grad_year).uniq.sort.reverse
    years.each do |year|
      @alums_by_year << Alum.where(:grad_year=> year).where("position_held is NOT NULL").order("position_order DESC")
    end
    @alums_by_year
  end

  def new
    @alum = Alum.new
  end

  def create
    @alum = Alum.new alum_params
    if @alum.valid?
      @alum.save
      flash[:notice] = "#{@alum.name} succesfully added as an SCM alum"
      redirect_to :back
    else
      flash[:error] = @alum.errors.full_messages.join(", ")
      redirect_to :back
    end
  end

  def edit
    @alum = Alum.find params[:id]
  end

  def update
    @alum = Alum.find params[:id]
    @alum.assign_attributes alum_params
    if @alum.valid?
      @alum.save
      flash[:notice] = "Alum succesfully updated"
      redirect_to admin_alums_path
    else
      flash[:error] = @alum.errors.full_messages.join(", ")
      redirect_to :back
    end
  end

  def destroy
    @alum = Alum.find params[:id]
    @alum.destroy
    flash[:notice] = "Alum successfully deleted"
    redirect_to admin_alums_path
  end

  private
  def alum_params
    params.require(:alum).permit(:name, :linkedin_url, :grad_year, :position_held, :position_type, :job_title, :company, :location, :bio)
  end
end
