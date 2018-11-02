class ApplicationController < ActionController::Base
    include Pundit
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

    def after_sign_in_path_for(resource)
        if params[:user][:job_category]
            new_job_path(:job_category => params[:user][:job_category], :postcode => params[:user][:postcode])
        else
            root_path
        end
    end
end

