OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, "75vmtv165i8zhy", "TnmRape64kdy1Hra", :scope => 'r_fullprofile', :fields => ["id", "email-address", "first-name", "last-name", "headline", "industry", "picture-url", "public-profile-url", "educations"]
end
