class RecruitersController < ApplicationController
  def new
    @recruiter = Recruiter.new
  end

  def create
    recruiter = Recruiter.new alum_params
    if recruiter.valid?
      recruiter.save
      flash[:notice] = "Thank you for your interest in SCM. A message was sent to the SCM leadership. They will contact you shortly."
    else
      flash[:error] = recruiter.errors.full_messages.join(", ")
    end
    redirect_to :back
  end

  private
  def alum_params
    params.require(:recruiter).permit(:name, :email, :company, :message)
  end
end
