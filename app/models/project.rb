class Project < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :title
  has_one :project_owner, :class_name => "User"
  has_many :invitations
  has_many :features

  def find_all_users
    emails = self.invitations.map(&:email) 
    emails << self.user.email
    emails
  end
end
