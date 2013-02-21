class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :feature
  attr_accessible :description

  default_scope order('created_at ASC') 
end
