class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    def respond_with(resource, _opts = {})
      if resource.persisted?
        register_success
      else
        register_failure
      end
    end
  
    def register_success
      render json: {
        message: 'Well done you signed in successfully',
        user: current_user
      }, status: 200
    end
  
    def register_failure
      render json: {
        message: 'Registration was unsuccessful'
      }, status: 422
    end
  end