class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Advertisment, state: 'published'
    can :read, User
    can :read, Type
    can :search, Advertisment
    can :autocomplete, Advertisment
    if user
      if user.role.user?
        can [:read, :update, :destroy], User, id: user.id
        can :change_state, Advertisment, user_id: user.id, state: ['sketch', 'archived', 'rejected']
        can :update, Advertisment, user_id: user.id, state: 'sketch'
        can [:read,:create, :destroy], Advertisment, user_id: user.id
      elsif user.role.admin?
        can :manage, User
        can :destroy, Advertisment
        can :read, Advertisment
        can [:update, :change_state, :multiple_change_state, :moderation], Advertisment, state: 'new'
        cannot :edit, Advertisment
        can [:read, :create, :update], Type
        can :destroy, Type do |type|
          type.advertisments.blank?
        end
      end
    end
  end
end
