class ApplicationController < ActionController::Base
    def index
    end
    
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) << :name
    end
end
