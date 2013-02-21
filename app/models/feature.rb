class Feature < ActiveRecord::Base
  before_update :save_history

  belongs_to :user
  belongs_to :project
  attr_accessible :description, :title, :priority, :status
  has_many :comments
  has_many :feature_histories

  default_scope order("priority ASC, created_at ASC")

  def incomplete
    if status == "1"
      return false
    end
    return true
  end

  def not_accepted?
    if accepted == 'yes'
      return false
    end
    return true
  end

  def save_history
    feature_history = FeatureHistory.new()
    feature_history.feature_id = self.id
    feature_history.priority = self.priority_was
    feature_history.title = self.title_was
    feature_history.description = self.description_was
    feature_history.status = self.status_was
    feature_history.user_id = self.user_id_was
    feature_history.created_at = self.created_at_was
    feature_history.updated_at = self.updated_at_was
    feature_history.save
  end
end
