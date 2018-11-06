# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
 #The method below allows us to run create_profile method after a registration(sign-up) is completed. This will create an empty user profile with the the user_id equals to current_user id.
  after_action :create_profile, only: [:create]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   #super

  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private
  
  def create_profile
    if current_user
      @user_profile = UserProfile.new
      @user_profile.user_id = current_user.id
      @user_profile.save
    end 
  end

  protected

  def after_sign_up_path_for(resource)
    if params[:user][:job_category]
      new_job_path(:job_category => params[:user][:job_category])
    elsif params[:user][:become_tradie]
      root_path(:abn_insurance => 0)
    else
      root_path
    end
  end
end
