class Admin::RecruitersController < ApplicationController
  def index
    @recruiters = Recruiter.order "created_at DESC"
  end
end
