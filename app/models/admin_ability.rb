class AdminAbility
  include CanCan::Ability

  def initialize(user)
    # Allow any admin user to access everything
    if user && user.is_a?(AdminUser)
      can :manage, :all
    end
  end
end 