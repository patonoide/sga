class Ability

  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can [:read, :select_sector_records, :download], Record
      can [:edit, :update], User
      cannot :read, User
      cannot [:new, :create, :edit, :update]
    end
  end

end
