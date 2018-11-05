class PagesController < ApplicationController
  def welcome  
    if params[:abn_insurance]
      redirect_to edit_user_profile_path(current_user.user_profile.id, :abn_insurance => 0)
    end
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
