class UserProfileController < ApplicationController

  # GET /user_profile/1
  def show
  end

  # GET /user_profile/1/edit
  def edit
  end

  # PATCH/PUT /jobs/1
  def update
    respond_to do |format|
      if @user_profile.update(user_profile_params)
        format.html { redirect_to @user_profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        format.html { render :edit }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.require(:user_profile).permit(:bio, :contact, :name, :insurance, :abn, :street, :suburb, :postcode)
    end
end
