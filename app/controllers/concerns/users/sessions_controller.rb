class Users::SessionsController < Devise::SessionsController
    respond_to :json
   
    private
   
     def respond_with(_resource, _opts = {})
       if current_user
       render json: {
         message: 'You are logged in.',
         user: current_user
       }, status: 200
       else
         render json: {
         message: 'Log in failed',
       }, status: 422
       end
     end
   
     def respond_to_on_destroy
       if current_user != nil
         log_out_failure
       else
         log_out_success
       end
     end
   
     def log_out_success
       render json: { message: 'You are logged out.' }, status: 200
     end
   
     def log_out_failure
       render json: { message: 'Hmm nothing happened.' }, status: 401
     end
   end