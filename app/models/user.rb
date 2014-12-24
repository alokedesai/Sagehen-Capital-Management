class User < ActiveRecord::Base
  validate :approve_user

  def self.find_or_create_from_auth(auth)
    user = User.find_by_linkedin_id auth["extra"]["raw_info"]["id"]
    return user if user.present?
    user = User.new
    user.name = auth["info"]["name"]
    user.linkedin_id = auth["extra"]["raw_info"]["id"]
    user.image_url = auth["info"]["image"]
    user.linkedin_url = auth["info"]["urls"]["public_profile"]
    education = auth["extra"]["raw_info"]["educations"]
    # verify that the user has an education
    if education && education["values"]
      education["values"].each do |school|
        if "Pomona".in? school["schoolName"]
          user.major = school["fieldOfStudy"]
          user.grad_year = school["endDate"]["year"]
          user.approved = true
        end
      end
    end
    user
  end

  def approve_user
    errors.add(:base, "You must attend the Claremont Colleges to use this site") unless approved.present?
  end
end
