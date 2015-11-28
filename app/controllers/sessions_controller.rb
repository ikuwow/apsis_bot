class SessionsController < ApplicationController

  def new
  end

  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
          log_in user # SessionsHelper::log_in
          flash[:success] = "Logged in successfully."
          redirect_to user # user_url(user)
      else
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
      end
  end

end
