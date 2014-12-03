class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Advertisment, state: 'published'
    can :read, User
    can :read, Comment
    can :read, Review
    can :search, Advertisment
    can :autocomplete, Advertisment
    if user
      if user.role.user?
        can :create, Comment
        can [:update, :destroy], Comment, user_id: user.id
        can :create, Review
        can [:update, :destroy], Review, user_id: user.id
        can [:read, :update, :destroy], User, id: user.id
        can :change_state, Advertisment, user_id: user.id, state: ['sketch', 'archived', 'rejected']
        can :update, Advertisment, user_id: user.id, state: 'sketch'
        can [:read, :create, :destroy], Advertisment, user_id: user.id
        can [:cities_for_select, :models_for_select], Advertisment
      elsif user.role.admin?
        can [:update, :destroy], Comment
        can [:update, :destroy], Review
        can :manage, User
        can :destroy, Advertisment
        can :read, Advertisment
        can [:update, :change_state, :multiple_change_state, :moderation], Advertisment, state: 'new'
        cannot :edit, Advertisment
        can [:read, :create, :update], Type
        can :destroy, Type do |type|
          type.advertisments.blank?
        end
        can [:read, :create, :update], Country
        can :destroy, Country do |country|
          country.advertisments.blank?
          country.cities.blank?
        end
        can [:read, :create, :update], City
        can :destroy, City do |city|
          city.advertisments.blank?
        end
        can [:read, :create, :update], Condition
        can :destroy, Condition do |condition|
          condition.advertisments.blank?
        end
        can [:read, :create, :update], Style
        can :destroy, Style do |style|
          style.advertisments.blank?
        end
        can [:read, :create, :update], Mileage
        can :destroy, Mileage do |mileage|
          mileage.advertisments.blank?
        end
        can [:read, :create, :update], Year
        can :destroy, Year do |year|
          year.advertisments.blank?
        end
        can [:read, :create, :update], Engine
        can :destroy, Engine do |engine|
          engine.advertisments.blank?
        end
        can [:read, :create, :update], EngineVolume
        can :destroy, EngineVolume do |engine_volume|
          engine_volume.advertisments.blank?
        end
        can [:read, :create, :update], Transmission
        can :destroy, Transmission do |transmission|
          transmission.advertisments.blank?
        end
        can [:read, :create, :update], Door
        can :destroy, Door do |door|
          door.advertisments.blank?
        end
        can [:read, :create, :update], Color
        can :destroy, Color do |color|
          color.advertisments.blank?
        end
        can [:read, :create, :update], Make
        can :destroy, Make do |make|
          make.advertisments.blank?
          make.models.blank?
        end
        can [:read, :create, :update], Model
        can :destroy, Model do |model|
          model.advertisments.blank?
        end
        can [:read, :create, :update], Feature
        can :destroy, Feature do |feature|
          feature.advertisments.blank?
        end
      end
    end
  end
end
