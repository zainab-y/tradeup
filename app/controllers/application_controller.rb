class ApplicationController < ActionController::Base
    include Pundit
    before_action :configure_permitted_parameters, if: :devise_controller?
    # prevents saving of cached page
    before_action :set_no_cache

    protected

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

    def after_sign_in_path_for(resource)
        if params[:user][:job_category]
            new_job_path(:job_category => params[:user][:job_category])
        elsif params[:user][:become_tradie]
            edit_user_profile_path(current_user.user_profile.id, :abn_insurance => 0)
        else
            pages_signin_path
        end
    end

    private 

    def set_no_cache
        response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
        response.headers["Pragma"] = "no-cache"
        response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
end

