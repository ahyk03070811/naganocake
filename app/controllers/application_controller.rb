class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_up_path_for(resource)
   case resource
   when Admin
     admin_root_path
   when Customer
     root_path
   end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :customer
      root_path
    end
  end


   def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
   end

end
