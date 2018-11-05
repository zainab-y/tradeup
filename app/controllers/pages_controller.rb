class PagesController < ApplicationController
  def welcome  
  end

  def signin
    if !current_user.user_profile.present?
      user_profile = UserProfile.new
      user_profile.user_id = current_user.id
      user_profile.save
    end
    redirect_to root_path
  end
end
