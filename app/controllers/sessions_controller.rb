class SessionsController < ApplicationController
    skip_before_action :require_login, except: [:destroy]
    
    def new
    end

    def create
        @user = User.find_by(email: params[:email]) 
        if @user
          if @user.try(:authenticate, params[:password])
            session[:user_id] = @user.id
            redirect_to "/groups"
          else 
            flash[:errors]=["Password doesn't match"]
            redirect_to "/users"
          end
        else
          flash[:errors]=["User not found"]
          redirect_to "/users"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to "/users" 
    end
end
