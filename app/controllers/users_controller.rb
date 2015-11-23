class UsersController < ApplicationController
  def show
      @user = User.find(params[:id])
      # debugger (stop processing)
  end
end
