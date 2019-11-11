class ApplicationController < ActionController::Base
    
    def favorite_text
        return @favorite_exists ? "Unfavorite" : "Favorite"
    end
    
    helper_method :favorite_text
    
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
   

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:a_name, :a_address, :a_phonenumber, :a_paypal, :c_name, :address, :c_phonenumber, :c_paypal])
            devise_parameter_sanitizer.permit(:account_update, keys: [:a_name, :a_address, :a_phonenumber, :a_paypal, :c_name, :address, :c_phonenumber, :c_paypal])
        end
end