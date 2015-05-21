class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user != nil
      if user.admin?
        can :manage, :all
      else
        can :update, User, :id => user.id
        can :manage, Question, :user_id => user.id
        can :manage, Answer, :question => {:user_id => user.id}
      end
    end
  end
end
