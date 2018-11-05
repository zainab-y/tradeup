class PagesController < ApplicationController
  def welcome
    if params[:abn_insurance]
      redirect_to edit_user_profile_path(current_user.user_profile.id, :abn_insurance => 0)
    end
  end
end
