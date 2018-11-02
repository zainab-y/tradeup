class UserProfilePolicy < ApplicationPolicy
  attr_reader :user, :user_profile

  def initialize(user, user_profile)
    @user = user
    @user_profile = user_profile
  end

  def edit?
    @user == @user_profile.user
  end

  def trades_form?
    @user == @user_profile.user
  end

  def destroy?
    @user == @user_profile.user
  end
end
