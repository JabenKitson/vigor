class Ability
  include CanCan::Ability


  def initialize(user)
    alias_action :calendar, :to => :view_calendar
    alias_action :comment,  :to => :comment_on
        
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :board
      can :manage, [Post,Event,Recipe,Vegresource,Vrattribute,Vrhighlight,Review]
      can :read, [User,Role]
      can :update, [User], :user_id => user.id
    else 
      can :read, [User,Post,Event,Recipe,Vegresource,Vrattribute,Vrhighlight,Review]
      can :update, [User], :user_id => user.id
      can :list, Recipe
      can :view_calendar, Event
      can :list, Event
      can :comment_on, Post
      can :restaurants, Vegresource
      can :grocery, Vegresource
      can :csas, Vegresource
      can :videos, Vegresource
      can :websites, Vegresource
      can :books, Vegresource
    end
    if user.has_role? :member
      can :create, [Attachment,Event,Recipe,Vegresource,Vrhighlight,Review]
       can :update, [Attachment,Event,Recipe,Vegresource,Vrhighlight,Review], :user_id => user.id
       can :revew, [Event,Recipe,Vegresource]
   if user.has_role? :user
     can :create, [Review,Attachment,Vrhighlight]
     can :update, [Review,Attachment,Vrhighlight], :user_id => user.id
   end
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
