class Admin::RecruitersController < Admin::AdminController
  def index
    @recruiters = Recruiter.order "created_at DESC"
  end
end
