class ConfirmationsController < Devise::ConfirmationsController
    skip_before_action :authorize


    def after_confirmation_path_for(resource_name,resource)
        sign_in(resource)
        "https://main--unifyed.netlify.app/Home"
    end 
end
