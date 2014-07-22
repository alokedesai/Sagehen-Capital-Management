class AlumsController < ApplicationController
  def index
    @alums = Alum.all
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

  private
  def alum_params
    params.require(:alum).permit(:name, :linkedin_url, :grad_year, :position_held, :job_title, :company, :location, :bio)
  end
end
