class Ability

  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :manage, Record
      cannot :destroy, Record
      can [:edit, :update], User
      cannot :read, User
      cannot [:new, :create, :edit, :update]
    end
  end

end
