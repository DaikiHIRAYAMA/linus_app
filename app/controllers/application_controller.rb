class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [
            :name,
            :email,
            :postcode,
            :prefecture_name,
            :address_city,
            :address_street,
            :address_building
            ])
    end
    

    def after_sign_in_path_for(resource)
        case resource
        when Company
            companies_path
        when User
            root_path
        end
      end
end
