class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    
    if user.role? :admin
      can :manage, :all
    else
      can :create, Project
      can :read, Project do |project|
        user.projects.include?(project) || user.tracking_projects.include?(project)
      end
      can :update, Project do |project|
        project.try(:user) == user
      end
      can :destroy, Project do |project|
        project.try(:user) == user
      end

      can :create, Feature do |feature|
        user.projects.include?(feature.project)
      end
      can :read, Feature do |feature|
        user.projects.include?(feature.project) || user.tracking_projects.include?(feature.project)
      end
      can :update, Feature do |feature|
        feature.not_accepted? && feature.try(:user) == user
      end
      can :destroy, Feature do |feature|
        feature.try(:user) == user && feature.not_accepted? 
      end

      can :read, Comment
      can :create, Comment
      can :update, Comment do |comment|
        comment.try(:user) == user
      end
    end
  end
end


