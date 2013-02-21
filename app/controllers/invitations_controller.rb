class InvitationsController < ApplicationController
  # GET /invitations
  # GET /invitations.json
  def index
    @invitations = Invitation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invitations }
    end
  end

  # POST /invitations
  # POST /invitations.json
  def create
    emails = params[:invites].gsub(/\s+/, "").split(',')
    project = Project.find(params[:project_id])
    emails.each do |email|
      user = User.where(:email => email).count == 1 ? true : false
      invitation = Invitation.new(:email => email)
      invitation.project = project
      project_title = project.try(:title)
      if invitation.save
        UserMailer.invitation_confirmation(email, current_user.email, project_title, user).deliver
      end
    end

    render :text => 'Invitation sent successfully.'

  end

end
