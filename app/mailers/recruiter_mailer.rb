class RecruiterMailer < ActionMailer::Base
  default from: "scm@gmail.com"

  def recruiter_notification(recruiter)
    # TODO: figure out a way to change who this gets emailed to on a
    # per year basis
    @recruiter = recruiter
    mail(to: "aloke.desai@gmail.com", subject: "A recruiter has contacted SCM!" )
  end
end
