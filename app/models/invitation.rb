class Invitation < ActiveRecord::Base
  belongs_to :project
  attr_accessible :email

  validates_uniqueness_of :email, :scope => :project_id
end
