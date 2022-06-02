class ConfirmationsController < Devise::ConfirmationsController
    # skip_before_action :authorize

    private

    def after_confirmation_path_for(resource_name,resource)
        debugger
        sign_in(resource)
        account_path
    end 
end
