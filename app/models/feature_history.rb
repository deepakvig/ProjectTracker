class FeatureHistory < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :feature
  attr_accessible :accepted, :description, :priority, :status, :title, :user_id, :project_id, :created_at, :updated_at, :feature_id
end
