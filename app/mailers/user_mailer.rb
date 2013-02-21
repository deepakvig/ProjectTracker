class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invitation_confirmation.subject
  #
  def invitation_confirmation(email, sender_email, project_title, is_user=false)
    @sender_email = sender_email
    @project_title = project_title
    @response_text = "#{@sender_email} has invited you to join Project <b>#{@project_title}</b>. "

    if is_user 
      @response_text += "Please Log in to #{root_url} to access the Project"
    else
      @response_text += "Please Sign up: #{sign_up_url} to access the Project"
    end

    mail to: email
  end

  def new_comment(emails, sender_email, project_title)
    @sender_email = sender_email
    @project_title = project_title

    mail to: emails
  end
end
