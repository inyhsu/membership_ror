class UsersController < ApplicationController
  skip_before_action :require_login, except: [:edit, :show]
    
  def new
    if current_user
        redirect_to "/groups"
    end
  end

  def create
      @user = User.create(user_params)

      if @user.valid?
          session[:user_id] = @user.id
          puts "User #{session[:user_id]}"
          redirect_to "/groups"
      else

          flash[:errors] = @user.errors.full_messages
          redirect_to "/users"
      end
  end

  def show

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
