class ApplicationController < ActionController::Base

    #rescue_from Exception, with: :render_500
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404



  def render_404
    render file: "#{Rails.root}/public/404.html", status: 404, layout: 'application', content_type: 'text/html', formats: :html
  end

  #def render_500
  #  render  file: "#{Rails.root}/public/500.html", status: 500, layout: 'application', content_type: 'text/html', formats: :html
  #end

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
