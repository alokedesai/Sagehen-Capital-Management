class User < ActiveRecord::Base
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
        end
      end
    end

    # automatically grant approval for now (this was confusing for some users so i'm temporarily getting rid of it
    user.approved = true
    user.save!
    user
  end

end
